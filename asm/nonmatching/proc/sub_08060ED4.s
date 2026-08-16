	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060ED4
sub_08060ED4: @ 0x08060ED4
	adds r3, r0, #0
	movs r2, #0
	ldr r0, _08060EE0 @ =gUnknown_085766E4
	ldr r1, [r0]
	b _08060EF4
	.align 2, 0
_08060EE0: .4byte gUnknown_085766E4
_08060EE4:
	ldrb r0, [r1, #2]
	cmp r0, r3
	bne _08060EF2
	ldrb r0, [r1, #3]
	cmp r0, #0xfe
	beq _08060EF2
	adds r2, #1
_08060EF2:
	adds r1, #4
_08060EF4:
	ldrb r0, [r1]
	cmp r0, #0xfe
	bls _08060EE4
	adds r0, r2, #0
	bx lr
	.align 2, 0

