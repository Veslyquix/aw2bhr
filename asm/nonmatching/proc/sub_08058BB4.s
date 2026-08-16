	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08058BB4
sub_08058BB4: @ 0x08058BB4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r6, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08058C34 @ =gUnknown_08499594
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r4, [r2]
	adds r4, r4, r1
	movs r0, #0
	str r0, [sp, #4]
	ldr r2, _08058C38 @ =gUnknown_085D5ABC
	ldr r0, _08058C3C @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r5, [r0, #0x1d]
	ldr r0, _08058C40 @ =0x0000270F
	mov r8, r0
	mov r0, r8
	strh r0, [r6]
	ldrb r0, [r4, #2]
	subs r0, #1
	ldrb r1, [r4, #3]
	str r6, [sp]
	adds r2, r5, #0
	add r3, sp, #4
	bl sub_08058CE8
	ldrb r0, [r4, #2]
	adds r0, #1
	ldrb r1, [r4, #3]
	str r6, [sp]
	adds r2, r5, #0
	add r3, sp, #4
	bl sub_08058CE8
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	subs r1, #1
	str r6, [sp]
	adds r2, r5, #0
	add r3, sp, #4
	bl sub_08058CE8
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	adds r1, #1
	str r6, [sp]
	adds r2, r5, #0
	add r3, sp, #4
	bl sub_08058CE8
	ldrh r0, [r6]
	cmp r0, r8
	beq _08058C44
	ldr r0, [sp, #4]
	b _08058C48
	.align 2, 0
_08058C34: .4byte gUnknown_08499594
_08058C38: .4byte gUnknown_085D5ABC
_08058C3C: .4byte gUnknown_030040D8
_08058C40: .4byte 0x0000270F
_08058C44:
	movs r0, #1
	rsbs r0, r0, #0
_08058C48:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

