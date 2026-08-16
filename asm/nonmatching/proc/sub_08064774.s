	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064774
sub_08064774: @ 0x08064774
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _080647B4 @ =gUnknown_0816E0C0
	add r0, sp, #4
	movs r2, #8
	bl sub_0808B6E8
	adds r0, r4, #0
	adds r0, #0x48
	ldrb r0, [r0]
	lsls r0, r0, #1
	add r0, sp
	adds r0, #4
	ldrh r0, [r0]
	ldrh r2, [r4, #0x28]
	ldr r1, _080647B8 @ =0x000001FF
	ands r1, r2
	movs r3, #0x2a
	ldrsh r2, [r4, r3]
	adds r2, #0xc
	movs r3, #0xff
	ands r2, r3
	movs r3, #0
	str r3, [sp]
	bl sub_0801F34C
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080647B4: .4byte gUnknown_0816E0C0
_080647B8: .4byte 0x000001FF

