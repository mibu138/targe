#include "a_audio.h"
#include <unistd.h>

int main(int argc, char *argv[])
{
    a_Init();
    a_PlayBeep();
    sleep(1);
    a_CleanUp();
    return 0;
}
