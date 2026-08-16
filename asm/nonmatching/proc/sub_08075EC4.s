	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075EC4
sub_08075EC4: @ 0x08075EC4
	ldr r1, _08075EF8 @ =gUnknown_0202FDFC
	movs r2, #4
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _08075ED0
	adds r0, #7
_08075ED0:
	asrs r3, r0, #3
	movs r2, #6
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _08075EDC
	adds r0, #7
_08075EDC:
	asrs r0, r0, #3
	movs r1, #0x14
	subs r1, r1, r0
	adds r0, r3, #0
	muls r0, r3, r0
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r2, r0, r1
	cmp r2, #0xe0
	bgt _08075EFC
	movs r0, #1
	b _08075F18
	.align 2, 0
_08075EF8: .4byte gUnknown_0202FDFC
_08075EFC:
	movs r0, #0x1e
	subs r0, r0, r3
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	adds r2, r0, r1
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r2, r0
	ble _08075F14
	movs r0, #0
	b _08075F18
_08075F14:
	movs r0, #1
	rsbs r0, r0, #0
_08075F18:
	bx lr
	.align 2, 0

