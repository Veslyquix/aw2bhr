	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076F34
sub_08076F34: @ 0x08076F34
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r7, _08076FF0 @ =gUnknown_0202FE38
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0807702E
	adds r6, r7, #0
	subs r6, #0x3c
	ldr r1, _08076FF4 @ =gUnknown_08615194
	mov sb, r1
_08076F56:
	ldrh r0, [r6]
	ldrh r1, [r6, #4]
	adds r0, r0, r1
	ldrh r2, [r7, #2]
	subs r2, r2, r0
	ldrh r0, [r6, #2]
	ldrh r1, [r6, #6]
	adds r0, r0, r1
	ldrh r1, [r7, #4]
	subs r1, r1, r0
	lsls r4, r2, #0x10
	asrs r0, r4, #0x10
	lsls r5, r1, #0x10
	asrs r1, r5, #0x10
	bl sub_08076F14
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08077020
	asrs r4, r4, #0x12
	adds r0, r4, #0
	bl sub_08076CAC
	asrs r5, r5, #0x12
	adds r0, r5, #0
	bl sub_08076D68
	cmp r4, #0
	bne _0807702E
	cmp r5, #0
	bne _0807702E
	ldrb r5, [r6, #0x10]
	cmp r5, #0
	bne _0807702E
	movs r0, #1
	strb r0, [r6, #0x10]
	movs r1, #0
	ldrsh r0, [r7, r1]
	str r0, [r6, #0xc]
	ldrh r0, [r7, #2]
	ldrh r1, [r6]
	subs r0, r0, r1
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r7, #4]
	ldrh r2, [r6, #2]
	subs r1, r1, r2
	adds r1, #2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #1
	bl sub_0807553C
	bl sub_0803866C
	adds r4, r0, #0
	cmp r4, #0
	beq _08076FF8
	movs r0, #0
	ldrsh r1, [r7, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	add r0, sb
	ldrb r1, [r0, #4]
	ldrh r2, [r6, #4]
	adds r2, #8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r3, [r6, #6]
	adds r3, #0xc
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r5, [sp]
	b _08077018
	.align 2, 0
_08076FF0: .4byte gUnknown_0202FE38
_08076FF4: .4byte gUnknown_08615194
_08076FF8:
	movs r0, #0
	ldrsh r1, [r7, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	add r0, sb
	ldrb r1, [r0, #3]
	ldrh r2, [r6, #4]
	adds r2, #8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r3, [r6, #6]
	adds r3, #0xc
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r4, [sp]
_08077018:
	mov r0, r8
	bl sub_08075298
	b _0807702E
_08077020:
	adds r7, #0xc
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08076F56
_0807702E:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

