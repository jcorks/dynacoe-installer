#include <windows.h>

// As per KB104011, should simply propagate env var changes

int main(int argc, char * argv) {
    DWORD dwReturnValue;

    SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, 0,
    (LPARAM) "Environment", SMTO_ABORTIFHUNG,
    5000, &dwReturnValue);	
    return dwReturnValue;
}
