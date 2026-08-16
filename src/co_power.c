#include "global.h"

// A depth counter incremented/decremented around CO Power script sequences (per Xenesis's
// RE notes, referenced throughout the CO Power scripting commands).
extern s8 gUnknown_030030F0;

void sub_08034F7C(void)
{
    gUnknown_030030F0++;
}

void sub_08034F8C(void)
{
    if (gUnknown_030030F0 != 0) {
        gUnknown_030030F0--;
    }
}
