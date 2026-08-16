	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C6E8
sub_0801C6E8: @ 0x0801C6E8
	adds r2, r0, #0
	ldr r1, _0801C6FC @ =gUnknown_03000288
	movs r0, #0xa5
	lsls r0, r0, #2
	adds r3, r1, r0
_0801C6F2:
	ldr r0, [r1]
	cmp r0, r2
	bne _0801C700
	adds r0, r1, #0
	b _0801C708
	.align 2, 0
_0801C6FC: .4byte gUnknown_03000288
_0801C700:
	adds r1, #0x2c
	cmp r1, r3
	ble _0801C6F2
	movs r0, #0
_0801C708:
	bx lr
	.align 2, 0

