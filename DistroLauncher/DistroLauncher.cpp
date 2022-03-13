//
//    Copyright (C) Microsoft.  All rights reserved.
// Licensed under the terms described in the LICENSE file in the root of this project.
//

#include "stdafx.h"

// Commandline arguments:
constexpr auto ARG_CONFIG = L"config";
constexpr auto ARG_CONFIG_DEFAULT_USER = L"--default-user";
constexpr auto ARG_INSTALL = L"install";
constexpr auto ARG_INSTALL_ROOT = L"--root";
constexpr auto ARG_RUN = L"run";
constexpr auto ARG_RUN_C = L"-c";
constexpr auto ARG_DISTRO = L"--distribution";
constexpr auto ARG_DISTRO_D = L"-d";

#include <winrt/Windows.Foundation.h>
#include <winrt/Windows.System.h>
#include <winrt/Windows.Storage.h>


using namespace winrt;
using namespace Windows::Foundation;
using namespace Windows::System;
using namespace Windows::Storage;


// Helper class for calling WSL Functions:
// https://msdn.microsoft.com/en-us/library/windows/desktop/mt826874(v=vs.85).aspx
// ReSharper disable once CppInconsistentNaming
WslApiLoader g_wslApi(DistributionInfo::NAME);

static HRESULT InstallDistribution(bool createUser);
static HRESULT SetDefaultUser(std::wstring_view userName);

HRESULT InstallDistribution(const bool createUser)
{
    // Register the distribution.
    Helpers::PrintMessage(MSG_STATUS_INSTALLING);
    auto hr = g_wslApi.WslRegisterDistribution();
    if (FAILED(hr))
    {
        return hr;
    }

    // Delete /etc/resolv.conf to allow WSL to generate a version based on Windows networking information.
    DWORD exitCode;
    hr = g_wslApi.WslLaunchInteractive(L"/bin/rm /etc/resolv.conf", true, &exitCode);
    if (FAILED(hr))
    {
        return hr;
    }

    // Create a user account.
    if (createUser)
    {
        Helpers::PrintMessage(MSG_CREATE_USER_PROMPT);
        std::wstring userName;
        do
        {
            userName = Helpers::GetUserInput(MSG_ENTER_USERNAME, 32);
        }
        while (!DistributionInfo::CreateUser(userName));

        // Set this user account as the default.
        hr = SetDefaultUser(userName);
        if (FAILED(hr))
        {
            return hr;
        }
    }

    return hr;
}

HRESULT SetDefaultUser(std::wstring_view userName)
{
    // Query the UID of the given user name and configure the distribution
    // to use this UID as the default.
    const ULONG uid = DistributionInfo::QueryUid(userName);
    if (uid == UID_INVALID)
    {
        return E_INVALIDARG;
    }

    // Set the default user as root, so ChangeDefaultUserInWslConf chan make the change
    HRESULT hr = g_wslApi.WslConfigureDistribution(0, WSL_DISTRIBUTION_FLAGS_DEFAULT);
    if (FAILED(hr))
    {
        return hr;
    }

    hr = DistributionInfo::ChangeDefaultUserInWslConf(userName);
    if (FAILED(hr))
    {
        return hr;
    }

    hr = g_wslApi.WslConfigureDistribution(uid, WSL_DISTRIBUTION_FLAGS_DEFAULT);
    if (FAILED(hr))
    {
        return hr;
    }

    return hr;
}

int RetrieveCurrentTheme()
{
    DWORD value = 0;
    DWORD size = sizeof value;

    // ReSharper disable once CppTooWideScope
    // ReSharper disable once CppTooWideScopeInitStatement
    const auto status = RegGetValueW(HKEY_CURRENT_USER,
                                     L"SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize",
                                     L"AppsUseLightTheme",
                                     RRF_RT_DWORD,
                                     nullptr,
                                     &value,
                                     &size
    );

    if (status == ERROR_SUCCESS)
    {
        return static_cast<int>(value);
    }

    return -1;
}

fire_and_forget SyncIcon(const hstring& iconName)
{
    const hstring nameSuffix = L""; //value == 0 ? L"" : L"";

    const hstring extension = L".png";
    const hstring composedPath = iconName + nameSuffix + extension;
    const auto path = Uri(L"ms-appx:///Assets/" + composedPath);

    try
    {
        const auto iconFile = StorageFile::GetFileFromApplicationUriAsync(path).get();

        co_await iconFile.CopyAsync(ApplicationData::Current().LocalFolder(), iconName + extension,
                                    NameCollisionOption::FailIfExists);
    }
    catch (...)
    {
    }
}

int RetrieveWindowsVersion();

// ReSharper disable once IdentifierTypo
fire_and_forget ShowPengwinUi()
{
    // ReSharper disable once CppTooWideScope
    // ReSharper disable once CppTooWideScopeInitStatement
    const auto& file =
        co_await ApplicationData::Current().LocalFolder().TryGetItemAsync(L"MicrosoftStoreEngagementSDKId.txt");

    if (! file)
    {
        // ReSharper disable once StringLiteralTypo
        const hstring str = L"pengwinui://";

        const auto uri = Uri(str);

        co_await Launcher::LaunchUriAsync(uri);
    }
}

// ReSharper disable once IdentifierTypo
int wmain(const int argc, const wchar_t* argv[])
{
    // Update the title bar of the console window.
    SetConsoleTitleW(DistributionInfo::WINDOW_TITLE.c_str());

    // Initialize a vector of arguments.
    std::vector<std::wstring_view> arguments;
    for (auto index = 1; index < argc; index += 1)
    {
        arguments.push_back(argv[index]);
    }

    // Ensure that the Windows Subsystem for Linux optional component is installed.
    DWORD exitCode = 1;
    if (!g_wslApi.WslIsOptionalComponentInstalled())
    {
        Helpers::PrintMessage(MSG_MISSING_OPTIONAL_COMPONENT);
        if (arguments.empty())
        {
            Helpers::PromptForInput();
        }

        return static_cast<int>(exitCode);
    }

    // Install the distribution if it is not already.
    const auto installOnly = arguments.size() > 0 && arguments[0] == ARG_INSTALL;
    auto hr = S_OK;
    if (!g_wslApi.WslIsDistributionRegistered())
    {
        // If the "--root" option is specified, do not create a user account.
        const auto useRoot = installOnly && arguments.size() > 1 && arguments[1] == ARG_INSTALL_ROOT;
        hr = InstallDistribution(!useRoot);
        if (FAILED(hr))
        {
            if (hr == HRESULT_FROM_WIN32(ERROR_ALREADY_EXISTS))
            {
                Helpers::PrintMessage(MSG_INSTALL_ALREADY_EXISTS);
            }
        }
        else
        {
            Helpers::PrintMessage(MSG_INSTALL_SUCCESS);
        }

        exitCode = SUCCEEDED(hr) ? 0 : 1;
    }

    // Parse the command line arguments.
    if (SUCCEEDED(hr) && !installOnly)
    {
        // ReSharper disable once StringLiteralTypo
        SyncIcon(L"pengwin");
        SyncIcon(L"background1");
        SyncIcon(L"background2");
        ShowPengwinUi();

        if (arguments.size() >= 2 && (arguments[0] == ARG_DISTRO ||
            arguments[0] == ARG_DISTRO_D))
        {
            g_wslApi.SetDistributionName(arguments[1]);
            arguments.erase(arguments.begin(), arguments.begin() + 2);
        }

        if (arguments.empty())
        {
            hr = g_wslApi.WslLaunchInteractive(L"", false, &exitCode);

            // Check exitCode to see if wsl.exe returned that it could not start the Linux process
            // then prompt users for input so they can view the error message.
            if (SUCCEEDED(hr) && exitCode == UINT_MAX)
            {
                Helpers::PromptForInput();
            }
        }
        else if (arguments[0] == ARG_RUN ||
            arguments[0] == ARG_RUN_C)
        {
            std::wstring command;
            for (size_t index = 1; index < arguments.size(); index += 1)
            {
                command += L" ";
                command += arguments[index];
            }

            hr = g_wslApi.WslLaunchInteractive(command.c_str(), true, &exitCode);
        }
        else if (arguments[0] == ARG_CONFIG)
        {
            hr = E_INVALIDARG;
            if (arguments.size() == 3)
            {
                if (arguments[1] == ARG_CONFIG_DEFAULT_USER)
                {
                    hr = SetDefaultUser(arguments[2]);
                }
            }

            if (SUCCEEDED(hr))
            {
                exitCode = 0;
            }
        }
        else
        {
            Helpers::PrintMessage(MSG_USAGE, DistributionInfo::WINDOW_TITLE.c_str());
            return static_cast<int>(exitCode);
        }
    }

    // If an error was encountered, print an error message.
    if (FAILED(hr))
    {
        if (hr == HRESULT_FROM_WIN32(ERROR_LINUX_SUBSYSTEM_NOT_PRESENT))
        {
            Helpers::PrintMessage(MSG_MISSING_OPTIONAL_COMPONENT);
        }
        else if (hr == HCS_E_HYPERV_NOT_INSTALLED)
        {
            Helpers::PrintMessage(MSG_ENABLE_VIRTUALIZATION);
        }
        else
        {
            Helpers::PrintErrorMessage(hr);
        }

        if (arguments.empty())
        {
            Helpers::PromptForInput();
        }
    }

    return SUCCEEDED(hr) ? exitCode : 1;
}
