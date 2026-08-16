	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032AFC
sub_08032AFC: @ 0x08032AFC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r1, _08032B68 @ =gUnknown_030030CC
	ldrb r0, [r1, #1]
	movs r5, #0x20
	orrs r0, r5
	strb r0, [r1, #1]
	ldr r1, _08032B6C @ =gUnknown_03002B40
	movs r0, #0x5e
	strb r0, [r1]
	ldr r1, _08032B70 @ =gUnknown_03002B4C
	movs r0, #0xdc
	strb r0, [r1]
	ldr r0, _08032B74 @ =gUnknown_03002EFC
	strb r5, [r0]
	ldr r1, _08032B78 @ =gUnknown_03002B44
	movs r0, #0x80
	strb r0, [r1]
	ldr r2, _08032B7C @ =gUnknown_030030A4
	ldrb r0, [r2]
	movs r1, #1
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r6, #4
	orrs r0, r6
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	ldr r2, _08032B80 @ =gUnknown_030030DC
	ldrb r0, [r2]
	mov r1, r8
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r6
	orrs r0, r4
	orrs r0, r3
	orrs r0, r5
	strb r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032B68: .4byte gUnknown_030030CC
_08032B6C: .4byte gUnknown_03002B40
_08032B70: .4byte gUnknown_03002B4C
_08032B74: .4byte gUnknown_03002EFC
_08032B78: .4byte gUnknown_03002B44
_08032B7C: .4byte gUnknown_030030A4
_08032B80: .4byte gUnknown_030030DC

