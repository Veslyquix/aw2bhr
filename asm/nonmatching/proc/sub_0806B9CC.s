	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806B9CC
sub_0806B9CC: @ 0x0806B9CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r5, _0806BA50 @ =gUnknown_030030A4
	ldrb r4, [r5, #1]
	movs r6, #2
	rsbs r6, r6, #0
	ands r6, r4
	movs r7, #2
	orrs r6, r7
	movs r4, #4
	mov ip, r4
	mov r5, ip
	orrs r6, r5
	movs r4, #9
	rsbs r4, r4, #0
	mov sl, r4
	ands r6, r4
	movs r5, #0x10
	mov sb, r5
	mov r4, sb
	orrs r6, r4
	ldr r5, _0806BA54 @ =gUnknown_030030DC
	mov r8, r5
	ldrb r4, [r5]
	movs r5, #1
	orrs r4, r5
	orrs r4, r7
	mov r5, ip
	orrs r4, r5
	mov r5, sl
	ands r4, r5
	mov r5, sb
	orrs r4, r5
	mov r5, r8
	strb r4, [r5]
	ldr r4, _0806BA58 @ =gUnknown_03002B68
	strb r0, [r4]
	ldr r0, _0806BA5C @ =gUnknown_03002B30
	strb r1, [r0]
	ldr r0, _0806BA60 @ =gUnknown_030024E4
	strb r2, [r0]
	ldr r0, _0806BA64 @ =gUnknown_030020B8
	strb r3, [r0]
	movs r1, #0x20
	orrs r6, r1
	ldr r0, _0806BA50 @ =gUnknown_030030A4
	strb r6, [r0, #1]
	ldrb r0, [r5, #1]
	orrs r0, r1
	strb r0, [r5, #1]
	ldr r2, _0806BA68 @ =gDispIo
	ldrb r0, [r2, #1]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BA50: .4byte gUnknown_030030A4
_0806BA54: .4byte gUnknown_030030DC
_0806BA58: .4byte gUnknown_03002B68
_0806BA5C: .4byte gUnknown_03002B30
_0806BA60: .4byte gUnknown_030024E4
_0806BA64: .4byte gUnknown_030020B8
_0806BA68: .4byte gDispIo

