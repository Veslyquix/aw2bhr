	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C474
sub_0806C474: @ 0x0806C474
	push {lr}
	ldr r0, _0806C500 @ =gUnknown_085819D4
	bl Proc_EndEach
	ldr r2, _0806C504 @ =gUnknown_030030CC
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2, #1]
	ldr r3, _0806C508 @ =gUnknown_03002B6C
	ldrb r1, [r3]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldr r3, _0806C50C @ =gUnknown_03001FE8
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _0806C510 @ =gUnknown_030030B4
	ldrb r0, [r1]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r1]
	ldr r2, _0806C514 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_0801237C
	bl sub_08012358
	ldr r0, _0806C518 @ =gUnknown_081A29E4
	movs r1, #0
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _0806C51C @ =gUnknown_081A23B4
	ldr r1, _0806C520 @ =0x06008000
	bl sub_08011CAC
	ldr r0, _0806C524 @ =gUnknown_081A2854
	ldr r1, _0806C528 @ =0x0600F800
	bl sub_08011CAC
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	pop {r0}
	bx r0
	.align 2, 0
_0806C500: .4byte gUnknown_085819D4
_0806C504: .4byte gUnknown_030030CC
_0806C508: .4byte gUnknown_03002B6C
_0806C50C: .4byte gUnknown_03001FE8
_0806C510: .4byte gUnknown_030030B4
_0806C514: .4byte gUnknown_0300251C
_0806C518: .4byte gUnknown_081A29E4
_0806C51C: .4byte gUnknown_081A23B4
_0806C520: .4byte 0x06008000
_0806C524: .4byte gUnknown_081A2854
_0806C528: .4byte 0x0600F800

