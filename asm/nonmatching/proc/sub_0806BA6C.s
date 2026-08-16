	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806BA6C
sub_0806BA6C: @ 0x0806BA6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _0806BAEC @ =gUnknown_030030A4
	ldrb r6, [r4]
	movs r5, #1
	mov ip, r5
	mov r7, ip
	orrs r6, r7
	movs r4, #2
	mov sl, r4
	mov r5, sl
	orrs r6, r5
	movs r5, #4
	orrs r6, r5
	movs r4, #8
	orrs r6, r4
	movs r7, #0x10
	mov sb, r7
	mov r4, sb
	orrs r6, r4
	ldr r7, _0806BAF0 @ =gUnknown_030030DC
	mov r8, r7
	ldrb r4, [r7]
	mov r7, ip
	orrs r4, r7
	mov r7, sl
	orrs r4, r7
	orrs r4, r5
	movs r5, #9
	rsbs r5, r5, #0
	ands r4, r5
	mov r5, sb
	orrs r4, r5
	mov r7, r8
	strb r4, [r7]
	ldr r4, _0806BAF4 @ =gUnknown_03002B40
	strb r0, [r4]
	ldr r0, _0806BAF8 @ =gUnknown_03002EFC
	strb r1, [r0]
	ldr r0, _0806BAFC @ =gUnknown_03002B4C
	strb r2, [r0]
	ldr r0, _0806BB00 @ =gUnknown_03002B44
	strb r3, [r0]
	movs r1, #0x20
	orrs r6, r1
	ldr r0, _0806BAEC @ =gUnknown_030030A4
	strb r6, [r0]
	ldrb r0, [r7, #1]
	orrs r0, r1
	strb r0, [r7, #1]
	ldr r2, _0806BB04 @ =gDispIo
	ldrb r0, [r2, #1]
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
_0806BAEC: .4byte gUnknown_030030A4
_0806BAF0: .4byte gUnknown_030030DC
_0806BAF4: .4byte gUnknown_03002B40
_0806BAF8: .4byte gUnknown_03002EFC
_0806BAFC: .4byte gUnknown_03002B4C
_0806BB00: .4byte gUnknown_03002B44
_0806BB04: .4byte gDispIo

