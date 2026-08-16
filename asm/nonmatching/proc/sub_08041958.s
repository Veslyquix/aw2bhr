	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041958
sub_08041958: @ 0x08041958
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x4c]
	cmp r0, #0
	beq _0804196A
	adds r1, r2, #0
	bl sub_0804074C
	b _08041972
_0804196A:
	ldr r0, [r2, #0x2c]
	ldr r1, [r2, #0x30]
	bl sub_08040790
_08041972:
	pop {r0}
	bx r0
	.align 2, 0

