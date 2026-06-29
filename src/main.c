#include <gccore.h>
#include <wiiuse/wpad.h>
#include <stdlib.h>

int main() {
    VIDEO_Init();
    WPAD_Init();
    while(1) {
        WPAD_ScanPads();
        if (WPAD_ButtonsDown(0) & WPAD_BUTTON_HOME) exit(0);
    }
    return 0;
}
