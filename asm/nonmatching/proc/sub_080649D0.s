	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080649D0
sub_080649D0: @ 0x080649D0
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _08064A14 @ =gUnknown_0816E0C8
	add r0, sp, #4
	movs r2, #8
	bl sub_0808B6E8
	adds r0, r4, #0
	adds r0, #0x48
	ldrb r0, [r0]
	lsls r0, r0, #1
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	ldrh r0, [r1]
	cmp r0, #0xcb
	bne _08064A1C
	movs r2, #0x28
	ldrsh r1, [r4, r2]
	adds r1, #8
	ldr r2, _08064A18 @ =0x000001FF
	ands r1, r2
	movs r3, #0x2a
	ldrsh r2, [r4, r3]
	adds r2, #0xc
	movs r3, #0xff
	ands r2, r3
	movs r3, #0
	str r3, [sp]
	bl sub_0801F34C
	b _08064A36
	.align 2, 0
_08064A14: .4byte gUnknown_0816E0C8
_08064A18: .4byte 0x000001FF
_08064A1C:
	ldrh r0, [r1]
	ldrh r2, [r4, #0x28]
	ldr r1, _08064A40 @ =0x000001FF
	ands r1, r2
	movs r3, #0x2a
	ldrsh r2, [r4, r3]
	adds r2, #0xc
	movs r3, #0xff
	ands r2, r3
	movs r3, #0
	str r3, [sp]
	bl sub_0801F34C
_08064A36:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064A40: .4byte 0x000001FF

