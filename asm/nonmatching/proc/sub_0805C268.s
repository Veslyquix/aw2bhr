	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805C268
sub_0805C268: @ 0x0805C268
	ldr r1, _0805C288 @ =gUnknown_03003FC0
	adds r0, r1, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #1
	bne _0805C28C
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0805C28C
	movs r0, #0
	b _0805C28E
	.align 2, 0
_0805C288: .4byte gUnknown_03003FC0
_0805C28C:
	movs r0, #1
_0805C28E:
	bx lr

