	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064918
sub_08064918: @ 0x08064918
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r6, #0
	adds r1, r5, #0
	adds r1, #0x48
	ldrb r0, [r1]
	cmp r0, #0
	bne _08064950
	movs r0, #0x28
	ldrsh r1, [r5, r0]
	adds r1, #8
	ldr r0, _0806494C @ =0x000001FF
	ands r1, r0
	movs r3, #0x2a
	ldrsh r2, [r5, r3]
	adds r2, #0xc
	movs r0, #0xff
	ands r2, r0
	str r6, [sp]
	movs r0, #0xcb
	movs r3, #0
	bl sub_0801F34C
	b _080649BE
	.align 2, 0
_0806494C: .4byte 0x000001FF
_08064950:
	ldrb r0, [r1]
	ldr r1, _080649C8 @ =gUnknown_08580934
	ldr r1, [r1]
	ldrb r1, [r1, #0x15]
	adds r0, r0, r1
	subs r0, #1
	mov r4, sp
	adds r4, #5
	mov r7, sp
	adds r7, #6
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_08063A58
	ldrb r0, [r4]
	cmp r0, #1
	bne _08064976
	movs r6, #1
_08064976:
	cmp r0, #0xff
	beq _0806499E
	ldrb r0, [r4]
	adds r0, #0x55
	movs r2, #0x28
	ldrsh r1, [r5, r2]
	adds r2, r6, #0
	adds r2, #8
	adds r1, r1, r2
	ldr r2, _080649CC @ =0x000001FF
	ands r1, r2
	movs r3, #0x2a
	ldrsh r2, [r5, r3]
	adds r2, #0xc
	movs r3, #0xff
	ands r2, r3
	movs r3, #0
	str r3, [sp]
	bl sub_0801F34C
_0806499E:
	ldrb r0, [r7]
	adds r0, #0x55
	movs r2, #0x28
	ldrsh r1, [r5, r2]
	adds r1, #0x10
	ldr r2, _080649CC @ =0x000001FF
	ands r1, r2
	movs r3, #0x2a
	ldrsh r2, [r5, r3]
	adds r2, #0xc
	movs r3, #0xff
	ands r2, r3
	movs r3, #0
	str r3, [sp]
	bl sub_0801F34C
_080649BE:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080649C8: .4byte gUnknown_08580934
_080649CC: .4byte 0x000001FF

