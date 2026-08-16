	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031DC0
sub_08031DC0: @ 0x08031DC0
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	ldr r0, _08031E34 @ =gUnknown_08499594
	ldr r4, [r0]
	ldr r5, _08031E38 @ =gUnknown_030040D8
	adds r0, r4, #0
	adds r0, #0xc
	str r0, [r5]
	ldr r0, _08031E3C @ =gUnknown_08499578
	mov r8, r0
	ldr r0, [r0]
	movs r6, #2
	str r6, [sp]
	movs r1, #0
	mov sb, r1
	str r1, [sp, #4]
	movs r1, #0xc
	movs r2, #8
	movs r3, #2
	bl sub_08012BC8
	movs r0, #1
	strb r0, [r4, #0x18]
	ldrb r1, [r4, #0x1c]
	subs r0, #0x81
	ands r0, r1
	movs r1, #0x64
	orrs r0, r1
	strb r0, [r4, #0x1c]
	ldr r1, [r5]
	movs r0, #0x17
	strb r0, [r1]
	ldr r0, [r5]
	strb r6, [r0, #7]
	mov r0, r8
	ldr r2, [r0]
	ldr r3, _08031E40 @ =gUnknown_08090D18
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	mov r1, sb
	str r1, [sp, #4]
	movs r0, #0x18
	movs r1, #8
	bl sub_080149C0
	bl sub_08013AEC
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031E34: .4byte gUnknown_08499594
_08031E38: .4byte gUnknown_030040D8
_08031E3C: .4byte gUnknown_08499578
_08031E40: .4byte gUnknown_08090D18

