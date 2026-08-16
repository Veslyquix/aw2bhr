	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061928
sub_08061928: @ 0x08061928
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r4, _08061A34 @ =gUnknown_085771C4
	mov r8, r4
	lsls r5, r1, #2
	adds r5, r5, r1
	lsls r5, r5, #2
	subs r5, r5, r1
	lsls r5, r5, #4
	add r5, r8
	ldr r6, _08061A38 @ =gUnknown_0857690C
	ldr r1, _08061A3C @ =gUnknown_08499598
	ldr r1, [r1]
	lsls r4, r3, #4
	subs r4, r4, r3
	lsls r4, r4, #2
	adds r4, r4, r1
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	subs r1, r1, r2
	ldrb r4, [r4, #0x1d]
	adds r1, r1, r4
	adds r1, r1, r6
	ldrb r1, [r1]
	lsls r2, r1, #2
	adds r2, r2, r1
	lsls r2, r2, #2
	subs r2, r2, r1
	lsls r2, r2, #4
	add r2, r8
	ldrb r1, [r5]
	strb r1, [r0]
	ldrb r1, [r5, #1]
	strb r1, [r0, #1]
	ldrb r1, [r5, #2]
	strb r1, [r0, #2]
	ldrb r1, [r5, #3]
	strb r1, [r0, #3]
	ldrb r1, [r5, #4]
	strb r1, [r0, #4]
	ldrb r1, [r5, #5]
	strb r1, [r0, #5]
	ldrb r1, [r5, #6]
	strb r1, [r0, #6]
	ldrb r1, [r5, #7]
	strb r1, [r0, #7]
	ldrb r1, [r5, #8]
	strb r1, [r0, #8]
	ldrb r1, [r5, #9]
	strb r1, [r0, #9]
	ldrb r1, [r5, #0xa]
	strb r1, [r0, #0xa]
	ldrb r1, [r5, #0xb]
	strb r1, [r0, #0xb]
	ldrb r1, [r5, #0xc]
	strb r1, [r0, #0xc]
	ldrb r1, [r5, #0xd]
	strb r1, [r0, #0xd]
	ldrb r1, [r5, #0xe]
	strb r1, [r0, #0xe]
	ldrb r1, [r5, #0xf]
	strb r1, [r0, #0xf]
	adds r1, r0, #0
	adds r1, #0x10
	adds r2, #0x10
	adds r5, #0x10
	movs r3, #0x17
_080619BE:
	ldrb r0, [r2]
	ldrb r4, [r5]
	adds r0, r0, r4
	strb r0, [r1]
	ldrb r0, [r2, #1]
	ldrb r4, [r5, #1]
	adds r0, r0, r4
	strb r0, [r1, #1]
	ldrb r0, [r2, #2]
	ldrb r4, [r5, #2]
	adds r0, r0, r4
	strb r0, [r1, #2]
	ldrb r0, [r2, #3]
	ldrb r4, [r5, #3]
	adds r0, r0, r4
	strb r0, [r1, #3]
	ldrb r0, [r2, #4]
	ldrb r4, [r5, #4]
	adds r0, r0, r4
	strb r0, [r1, #4]
	ldrb r0, [r2, #5]
	ldrb r4, [r5, #5]
	adds r0, r0, r4
	strb r0, [r1, #5]
	ldrb r0, [r2, #6]
	ldrb r4, [r5, #6]
	adds r0, r0, r4
	strb r0, [r1, #6]
	ldrb r0, [r2, #7]
	ldrb r4, [r5, #7]
	adds r0, r0, r4
	strb r0, [r1, #7]
	ldrb r0, [r2, #8]
	ldrb r4, [r5, #8]
	adds r0, r0, r4
	strb r0, [r1, #8]
	ldrb r0, [r2, #9]
	ldrb r4, [r5, #9]
	adds r0, r0, r4
	strb r0, [r1, #9]
	ldrb r0, [r2, #0xa]
	ldrb r4, [r5, #0xa]
	adds r0, r0, r4
	strb r0, [r1, #0xa]
	ldrb r0, [r2, #0xb]
	ldrb r4, [r5, #0xb]
	adds r0, r0, r4
	strb r0, [r1, #0xb]
	adds r1, #0xc
	adds r2, #0xc
	adds r5, #0xc
	subs r3, #1
	cmp r3, #0
	bge _080619BE
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061A34: .4byte gUnknown_085771C4
_08061A38: .4byte gUnknown_0857690C
_08061A3C: .4byte gUnknown_08499598

