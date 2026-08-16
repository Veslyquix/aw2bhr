	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08069B90
sub_08069B90: @ 0x08069B90
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	movs r0, #0x32
	subs r0, r0, r1
	cmp r0, #0x2b
	bls _08069BA0
	b _08069CE6
_08069BA0:
	lsls r0, r0, #2
	ldr r1, _08069BAC @ =_08069BB0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08069BAC: .4byte _08069BB0
_08069BB0: @ jump table
	.4byte _08069CB4 @ case 0
	.4byte _08069C6C @ case 1
	.4byte _08069CE6 @ case 2
	.4byte _08069CE6 @ case 3
	.4byte _08069CE6 @ case 4
	.4byte _08069CE6 @ case 5
	.4byte _08069C60 @ case 6
	.4byte _08069CE6 @ case 7
	.4byte _08069CE6 @ case 8
	.4byte _08069CE6 @ case 9
	.4byte _08069CE6 @ case 10
	.4byte _08069CE6 @ case 11
	.4byte _08069CE6 @ case 12
	.4byte _08069CE6 @ case 13
	.4byte _08069C94 @ case 14
	.4byte _08069C6C @ case 15
	.4byte _08069CE6 @ case 16
	.4byte _08069CE6 @ case 17
	.4byte _08069CE6 @ case 18
	.4byte _08069CE6 @ case 19
	.4byte _08069C60 @ case 20
	.4byte _08069CE6 @ case 21
	.4byte _08069CE6 @ case 22
	.4byte _08069CE6 @ case 23
	.4byte _08069CE6 @ case 24
	.4byte _08069CE6 @ case 25
	.4byte _08069CE6 @ case 26
	.4byte _08069CE6 @ case 27
	.4byte _08069C94 @ case 28
	.4byte _08069C6C @ case 29
	.4byte _08069CE6 @ case 30
	.4byte _08069CE6 @ case 31
	.4byte _08069CE6 @ case 32
	.4byte _08069CE6 @ case 33
	.4byte _08069C60 @ case 34
	.4byte _08069CE6 @ case 35
	.4byte _08069CE6 @ case 36
	.4byte _08069CE6 @ case 37
	.4byte _08069CE6 @ case 38
	.4byte _08069CE6 @ case 39
	.4byte _08069CE6 @ case 40
	.4byte _08069CE6 @ case 41
	.4byte _08069CC0 @ case 42
	.4byte _08069C6C @ case 43
_08069C60:
	ldr r0, _08069C68 @ =gUnknown_08581108
	bl Proc_EndEach
	b _08069CE6
	.align 2, 0
_08069C68: .4byte gUnknown_08581108
_08069C6C:
	ldr r2, _08069C90 @ =gUnknown_030030CC
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	b _08069CE6
	.align 2, 0
_08069C90: .4byte gUnknown_030030CC
_08069C94:
	ldr r2, _08069CBC @ =gUnknown_030030CC
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
_08069CB4:
	movs r0, #1
	bl sub_080678BC
	b _08069CE6
	.align 2, 0
_08069CBC: .4byte gUnknown_030030CC
_08069CC0:
	ldr r2, _08069CF4 @ =gUnknown_030030CC
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #1
	bl sub_080678BC
_08069CE6:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _08069CF8
	subs r0, #1
	str r0, [r4, #0x2c]
	b _08069D28
	.align 2, 0
_08069CF4: .4byte gUnknown_030030CC
_08069CF8:
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _08069D30 @ =gUnknown_08581108
	bl Proc_EndEach
	ldr r0, _08069D34 @ =gUnknown_08580FF4
	bl Proc_EndEach
	ldr r2, _08069D38 @ =gUnknown_030030CC
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
_08069D28:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069D30: .4byte gUnknown_08581108
_08069D34: .4byte gUnknown_08580FF4
_08069D38: .4byte gUnknown_030030CC

