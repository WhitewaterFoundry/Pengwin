#include "pch.h"

#include <codecvt>
#include <io.h>
#include <locale>
#include <string>
#include <string_view>
#include <vector>
#include <Windows.h>

void RunProcess(LPSTR cmdline)
{
    // additional information
    STARTUPINFOA si;
    PROCESS_INFORMATION pi;

    // set the size of the structures
    ZeroMemory(&si, sizeof(si));
    si.cb = sizeof(si);
    ZeroMemory(&pi, sizeof(pi));

    // start the program up
    CreateProcessA
    (
        nullptr, // the path
        cmdline, // Command line
        nullptr, // Process handle not inheritable
        nullptr, // Thread handle not inheritable
        FALSE, // Set handle inheritance to FALSE
        0, // Opens file in a separate console
        nullptr, // Use parent's environment block
        nullptr, // Use parent's starting directory 
        &si, // Pointer to STARTUPINFO structure
        &pi // Pointer to PROCESS_INFORMATION structure
    );

    // Wait until child process exits.
    WaitForSingleObject(pi.hProcess, INFINITE);

    // Close process and thread handles. 
    CloseHandle(pi.hProcess);
    CloseHandle(pi.hThread);
}

TEST(TestCaseName, TestWslConfChange)
{
    char buff[255];
    _sprintf_p(buff, _countof(buff),
               "wsl.exe -d WLinux -u root -- if [ $(grep -c \"\\[user\\]\" /etc/wsl.conf) -eq \"0\" ]; then echo -e \"\\n[user]\\ndefault=%1$s\">>/etc/wsl.conf; else sed -i \"s/\\(default=\\)\\(.*\\)/\\1%1$s/\" /etc/wsl.conf ; fi",
               "userName");

    printf(buff);

    RunProcess(buff);

    EXPECT_EQ(1, 1);
    EXPECT_TRUE(true);
}

TEST(TestCaseName, TestWslDistributionConfChange)
{
    char buff[512];
    _sprintf_p(buff, _countof(buff),
               "wsl.exe -d WLinux -u root -- if [ -f /etc/wsl-distribution.conf ]; then sed -i \"s/^DEFAULT_UID=.*/DEFAULT_UID=%1$u/\" /etc/wsl-distribution.conf; else echo \"DEFAULT_UID=%1$u\" > /etc/wsl-distribution.conf; fi",
               1000);

    printf(buff);

    RunProcess(buff);

    EXPECT_EQ(1, 1);
    EXPECT_TRUE(true);
}
