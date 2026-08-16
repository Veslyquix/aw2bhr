	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064738
sub_08064738: @ 0x08064738
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	adds r0, #0x48
	ldrb r0, [r0]
	movs r3, #0xc8
	cmp r0, #0
	beq _0806474A
	movs r3, #0xcb
_0806474A:
	movs r0, #0x28
	ldrsh r1, [r2, r0]
	adds r1, #8
	ldr r0, _08064770 @ =0x000001FF
	ands r1, r0
	movs r0, #0x2a
	ldrsh r2, [r2, r0]
	adds r2, #0xc
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	str r0, [sp]
	adds r0, r3, #0
	movs r3, #0
	bl sub_0801F34C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08064770: .4byte 0x000001FF

