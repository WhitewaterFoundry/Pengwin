//
//    Copyright (C) Microsoft.  All rights reserved.
// Licensed under the terms described in the LICENSE file in the root of this project.
//

#pragma once
#include <wslapi.h>

// This error definition is present in the Spring Creators Update SDK.
#ifndef ERROR_LINUX_SUBSYSTEM_NOT_PRESENT
#define ERROR_LINUX_SUBSYSTEM_NOT_PRESENT 414L
#endif // !ERROR_LINUX_SUBSYSTEM_NOT_PRESENT

using WSL_IS_DISTRIBUTION_REGISTERED = BOOL(STDAPICALLTYPE*)(PCWSTR);
using WSL_REGISTER_DISTRIBUTION = HRESULT(STDAPICALLTYPE*)(PCWSTR, PCWSTR);
using WSL_CONFIGURE_DISTRIBUTION = HRESULT(STDAPICALLTYPE*)(PCWSTR, ULONG, WSL_DISTRIBUTION_FLAGS);
using WSL_GET_DISTRIBUTION_CONFIGURATION = HRESULT(STDAPICALLTYPE*)(PCWSTR, ULONG*, ULONG*, WSL_DISTRIBUTION_FLAGS*,
                                                                    PSTR**, ULONG*);
using WSL_LAUNCH_INTERACTIVE = HRESULT(STDAPICALLTYPE*)(PCWSTR, PCWSTR, BOOL, DWORD*);
using WSL_LAUNCH = HRESULT(STDAPICALLTYPE*)(PCWSTR, PCWSTR, BOOL, HANDLE, HANDLE, HANDLE, HANDLE*);

class WslApiLoader
{
public:
    WslApiLoader(const std::wstring& distributionName);
    ~WslApiLoader();

    BOOL WslIsOptionalComponentInstalled() const;

    BOOL WslIsDistributionRegistered() const;

    HRESULT WslRegisterDistribution() const;

    HRESULT WslConfigureDistribution(ULONG defaultUID,
                                     WSL_DISTRIBUTION_FLAGS wslDistributionFlags) const;

    HRESULT WslLaunchInteractive(PCWSTR command,
                                 BOOL useCurrentWorkingDirectory,
                                 DWORD* exitCode) const;

    HRESULT WslLaunch(PCWSTR command,
                      BOOL useCurrentWorkingDirectory,
                      HANDLE stdIn,
                      HANDLE stdOut,
                      HANDLE stdErr,
                      HANDLE* process) const;

private:
    std::wstring _distributionName;
    HMODULE _wslApiDll;
    WSL_IS_DISTRIBUTION_REGISTERED _isDistributionRegistered;
    WSL_REGISTER_DISTRIBUTION _registerDistribution;
    WSL_CONFIGURE_DISTRIBUTION _configureDistribution;
    WSL_LAUNCH_INTERACTIVE _launchInteractive;
    WSL_LAUNCH _launch;
};

extern WslApiLoader g_wslApi;
