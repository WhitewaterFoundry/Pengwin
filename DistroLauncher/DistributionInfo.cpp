//
//    Copyright (C) Microsoft.  All rights reserved.
// Licensed under the terms described in the LICENSE file in the root of this project.
//

#include "stdafx.h"

HRESULT DistributionInfo::ChangeDefaultUserInWslConf(const std::wstring_view userName)
{
    DWORD exitCode = 0;

    wchar_t commandLine[255];
    _swprintf_p(commandLine, _countof(commandLine),
                L"if [ $(grep -c \"\\[user\\]\" /etc/wsl.conf) -eq \"0\" ]; then echo -e \"\\n[user]\\ndefault=%1$s\">>/etc/wsl.conf; else sed -i \"s/\\(default=\\)\\(.*\\)/\\1%1$s/\" /etc/wsl.conf ; fi",
                std::wstring(userName).c_str());

    if (const auto hr = g_wslApi.WslLaunchInteractive(commandLine, true, &exitCode); FAILED(hr) || exitCode != 0)
    {
        return hr;
    }

    return 0;
}

bool DistributionInfo::CreateUser(std::wstring_view userName)
{
    // Create the user account.
    DWORD exitCode;
    std::wstring commandLine = L"/usr/sbin/adduser --quiet --gecos '' ";
    commandLine += userName;
    auto hr = g_wslApi.WslLaunchInteractive(commandLine.c_str(), true, &exitCode);
    if (FAILED(hr) || exitCode != 0)
    {
        return false;
    }

    // Add the user account to any relevant groups.
    commandLine = L"/usr/sbin/usermod -aG adm,cdrom,sudo,dip,plugdev,video,irc ";
    commandLine += userName;
    hr = g_wslApi.WslLaunchInteractive(commandLine.c_str(), true, &exitCode);
    if (FAILED(hr) || exitCode != 0)
    {
        // Delete the user if the group add command failed.
        commandLine = L"/usr/sbin/deluser ";
        commandLine += userName;
        g_wslApi.WslLaunchInteractive(commandLine.c_str(), true, &exitCode);
        return false;
    }

    return true;
}

ULONG DistributionInfo::QueryUid(std::wstring_view userName)
{
    // Create a pipe to read the output of the launched process.
    HANDLE readPipe;
    HANDLE writePipe;
    SECURITY_ATTRIBUTES sa{sizeof sa, nullptr, true};
    auto uid = UID_INVALID;
    if (CreatePipe(&readPipe, &writePipe, &sa, 0))
    {
        // Query the UID of the supplied username.
        std::wstring command = L"/usr/bin/id -u ";
        command += userName;

        HANDLE child;
        // ReSharper disable once CppTooWideScope
        // ReSharper disable once CppTooWideScopeInitStatement
        auto hr = g_wslApi.WslLaunch(command.c_str(), true, GetStdHandle(STD_INPUT_HANDLE), writePipe,
                                     GetStdHandle(STD_ERROR_HANDLE), &child);
        if (SUCCEEDED(hr))
        {
            // Wait for the child to exit and ensure process exited successfully.
            WaitForSingleObject(child, INFINITE);
            DWORD exitCode;
            if (GetExitCodeProcess(child, &exitCode) == false || exitCode != 0)
            {
                hr = E_INVALIDARG;
            }

            CloseHandle(child);
            if (SUCCEEDED(hr))
            {
                // ReSharper disable once CppTooWideScope
                char buffer[64]{};
                DWORD bytesRead;

                // Read the output of the command from the pipe and convert to a UID.
                if (ReadFile(readPipe, buffer, sizeof buffer - 1, &bytesRead, nullptr))
                {
                    buffer[bytesRead] = ANSI_NULL;
                    try
                    {
                        uid = std::stoul(buffer, nullptr, 10);
                    }
                    catch (...)
                    {
                    }
                }
            }
        }

        CloseHandle(readPipe);
        CloseHandle(writePipe);
    }

    return uid;
}
