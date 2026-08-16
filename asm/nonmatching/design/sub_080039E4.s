	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080039E4
sub_080039E4: @ 0x080039E4
	push {lr}
	bl sub_08012358
	ldr r3, _08003A5C @ =gUnknown_030030E0
	ldrb r0, [r3]
	movs r1, #0xc0
	orrs r0, r1
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	movs r2, #2
	orrs r0, r2
	movs r2, #4
	orrs r0, r2
	movs r2, #8
	orrs r0, r2
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r3]
	ldrb r0, [r3, #1]
	ands r1, r0
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	subs r0, #2
	ands r1, r0
	subs r0, #4
	ands r1, r0
	subs r0, #8
	ands r1, r0
	strb r1, [r3, #1]
	ldr r0, _08003A60 @ =gUnknown_03001FFC
	movs r2, #0
	strh r2, [r0]
	ldr r1, _08003A64 @ =gUnknown_03002020
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _08003A68 @ =gUnknown_03002B28
	strh r2, [r0]
	ldr r3, _08003A6C @ =gUnknown_030030CC
	ldrb r1, [r3, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r3, #1]
	ldr r0, _08003A70 @ =gUnknown_03002B40
	strb r2, [r0]
	ldr r0, _08003A74 @ =gUnknown_03002B4C
	strb r2, [r0]
	ldr r0, _08003A78 @ =gUnknown_03002EFC
	movs r1, #0xa0
	strb r1, [r0]
	ldr r0, _08003A7C @ =gUnknown_03002B44
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08003A5C: .4byte gUnknown_030030E0
_08003A60: .4byte gUnknown_03001FFC
_08003A64: .4byte gUnknown_03002020
_08003A68: .4byte gUnknown_03002B28
_08003A6C: .4byte gUnknown_030030CC
_08003A70: .4byte gUnknown_03002B40
_08003A74: .4byte gUnknown_03002B4C
_08003A78: .4byte gUnknown_03002EFC
_08003A7C: .4byte gUnknown_03002B44

