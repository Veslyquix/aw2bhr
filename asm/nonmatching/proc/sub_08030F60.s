	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030F60
sub_08030F60: @ 0x08030F60
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	lsls r2, r0, #2
	ldr r3, _08030FF8 @ =gDispIo
	ldrb r1, [r3, #1]
	movs r4, #0x20
	mov r8, r4
	mov r4, r8
	orrs r1, r4
	strb r1, [r3, #1]
	ldr r4, _08030FFC @ =gUnknown_03002B40
	ldr r3, _08031000 @ =gUnknown_0849B188
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r1, [r0]
	strb r1, [r4]
	ldr r4, _08031004 @ =gUnknown_03002B4C
	adds r1, r2, #2
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrb r1, [r1]
	ldrb r0, [r0]
	adds r1, r1, r0
	strb r1, [r4]
	ldr r4, _08031008 @ =gUnknown_03002EFC
	adds r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	strb r0, [r4]
	ldr r4, _0803100C @ =gUnknown_03002B44
	adds r2, #3
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	adds r0, r0, r1
	strb r0, [r4]
	ldr r2, _08031010 @ =gUnknown_030030A4
	ldrb r0, [r2]
	movs r6, #1
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	ldr r2, _08031014 @ =gUnknown_030030DC
	movs r0, #0
	strh r0, [r2]
	ldrb r0, [r2]
	orrs r0, r6
	adds r1, #0x1e
	ands r0, r1
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	mov r1, r8
	orrs r0, r1
	strb r0, [r2]
	bl sub_08030F20
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030FF8: .4byte gDispIo
_08030FFC: .4byte gUnknown_03002B40
_08031000: .4byte gUnknown_0849B188
_08031004: .4byte gUnknown_03002B4C
_08031008: .4byte gUnknown_03002EFC
_0803100C: .4byte gUnknown_03002B44
_08031010: .4byte gUnknown_030030A4
_08031014: .4byte gUnknown_030030DC

