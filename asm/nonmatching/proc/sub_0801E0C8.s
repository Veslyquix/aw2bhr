	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E0C8
sub_0801E0C8: @ 0x0801E0C8
	ldr r2, _0801E0EC @ =gUnknown_03002520
	lsls r0, r0, #3
	adds r2, r0, r2
	cmp r1, #0
	ble _0801E0E8
	movs r3, #0xa0
	movs r0, #0
_0801E0D6:
	strh r3, [r2]
	adds r2, #2
	strh r0, [r2]
	adds r2, #2
	strh r0, [r2]
	adds r2, #4
	subs r1, #1
	cmp r1, #0
	bne _0801E0D6
_0801E0E8:
	bx lr
	.align 2, 0
_0801E0EC: .4byte gUnknown_03002520

