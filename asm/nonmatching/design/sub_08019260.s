	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019260
sub_08019260: @ 0x08019260
	movs r1, #0
	ldr r2, _0801927C @ =gUnknown_0200C528
_08019264:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _08019280
	movs r0, #1
	b _0801928E
	.align 2, 0
_0801927C: .4byte gUnknown_0200C528
_08019280:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08019264
	movs r0, #0
_0801928E:
	bx lr

