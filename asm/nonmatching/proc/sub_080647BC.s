	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080647BC
sub_080647BC: @ 0x080647BC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	movs r5, #0
	adds r0, #0x48
	ldrb r1, [r0]
	adds r1, #2
	lsls r0, r1, #2
	adds r0, r0, r1
	mov r4, sp
	adds r4, #5
	mov r6, sp
	adds r6, #6
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r6, #0
	bl sub_08063A58
	ldrb r0, [r4]
	cmp r0, #1
	bne _080647E8
	movs r5, #1
_080647E8:
	ldrb r0, [r4]
	adds r0, #0x55
	movs r2, #0x28
	ldrsh r1, [r7, r2]
	adds r1, r1, r5
	ldr r3, _08064868 @ =0x000001FF
	ands r1, r3
	movs r3, #0x2a
	ldrsh r2, [r7, r3]
	adds r2, #0xc
	movs r5, #0xff
	ands r2, r5
	movs r4, #0
	str r4, [sp]
	movs r3, #0
	bl sub_0801F34C
	ldrb r0, [r6]
	adds r0, #0x55
	movs r2, #0x28
	ldrsh r1, [r7, r2]
	adds r1, #8
	ldr r3, _08064868 @ =0x000001FF
	ands r1, r3
	movs r3, #0x2a
	ldrsh r2, [r7, r3]
	adds r2, #0xc
	ands r2, r5
	str r4, [sp]
	movs r3, #0
	bl sub_0801F34C
	movs r0, #0x28
	ldrsh r1, [r7, r0]
	adds r1, #0x10
	ldr r2, _08064868 @ =0x000001FF
	ands r1, r2
	movs r3, #0x2a
	ldrsh r2, [r7, r3]
	adds r2, #0xc
	ands r2, r5
	str r4, [sp]
	movs r0, #0x55
	movs r3, #0
	bl sub_0801F34C
	movs r0, #0x28
	ldrsh r1, [r7, r0]
	adds r1, #0x18
	ldr r2, _08064868 @ =0x000001FF
	ands r1, r2
	movs r3, #0x2a
	ldrsh r2, [r7, r3]
	adds r2, #0xc
	ands r2, r5
	str r4, [sp]
	movs r0, #0x55
	movs r3, #0
	bl sub_0801F34C
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064868: .4byte 0x000001FF

