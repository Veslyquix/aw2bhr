	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085208
sub_08085208: @ 0x08085208
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_080853B0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x14
	movs r1, #8
	movs r2, #0x28
	movs r3, #0
	bl sub_0801F34C
	adds r4, #0x66
	ldrb r0, [r4]
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808523C
	movs r0, #0
	ldrsh r2, [r4, r0]
	movs r0, #0x98
	movs r1, #0x70
	bl sub_080436DC
_0808523C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

