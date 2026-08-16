	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019C24
sub_08019C24: @ 0x08019C24
	ldr r0, _08019C3C @ =gUnknown_08499578
	movs r2, #0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
_08019C2E:
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bne _08019C2E
	bx lr
	.align 2, 0
_08019C3C: .4byte gUnknown_08499578

