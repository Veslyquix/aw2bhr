	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806EA88
sub_0806EA88: @ 0x0806EA88
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldr r1, _0806EB0C @ =gUnknown_030030CC
	ldrb r0, [r1, #1]
	movs r2, #0x20
	mov sb, r2
	mov r2, sb
	orrs r0, r2
	strb r0, [r1, #1]
	ldr r1, _0806EB10 @ =gUnknown_03002B40
	movs r0, #0x38
	strb r0, [r1]
	ldr r1, _0806EB14 @ =gUnknown_03002EFC
	movs r0, #0x80
	strb r0, [r1]
	ldr r1, _0806EB18 @ =gUnknown_03002B4C
	movs r0, #0xb8
	strb r0, [r1]
	ldr r1, _0806EB1C @ =gUnknown_03002B44
	movs r0, #0x90
	strb r0, [r1]
	ldr r0, _0806EB20 @ =gUnknown_030030A4
	mov sl, r0
	ldrb r1, [r0]
	movs r0, #1
	orrs r1, r0
	movs r2, #2
	mov r8, r2
	mov r0, r8
	orrs r1, r0
	movs r6, #4
	orrs r1, r6
	movs r5, #8
	orrs r1, r5
	movs r4, #0x10
	orrs r1, r4
	ldr r3, _0806EB24 @ =gUnknown_030030DC
	ldrb r2, [r3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	mov r2, r8
	orrs r0, r2
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	strb r0, [r3]
	mov r0, sb
	orrs r1, r0
	mov r2, sl
	strb r1, [r2]
	ldrb r0, [r3, #1]
	mov r1, sb
	orrs r0, r1
	strb r0, [r3, #1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806EB0C: .4byte gUnknown_030030CC
_0806EB10: .4byte gUnknown_03002B40
_0806EB14: .4byte gUnknown_03002EFC
_0806EB18: .4byte gUnknown_03002B4C
_0806EB1C: .4byte gUnknown_03002B44
_0806EB20: .4byte gUnknown_030030A4
_0806EB24: .4byte gUnknown_030030DC

