	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C784
sub_0803C784: @ 0x0803C784
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	movs r1, #0
	ldr r0, _0803C80C @ =gUnknown_02027FB0
	movs r5, #0xf
_0803C796:
	str r1, [r0]
	strb r1, [r0, #4]
	adds r0, #8
	subs r5, #1
	cmp r5, #0
	bge _0803C796
	movs r7, #0
	movs r5, #0
	ldr r2, _0803C810 @ =gUnknown_0849EDB0
	ldr r1, [r2, #4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0803C7F6
	mov r8, r2
	mov r6, r8
	adds r6, #4
	mov sb, r5
_0803C7BA:
	mov r0, r8
	adds r0, #8
	mov r1, sb
	adds r4, r1, r0
	ldr r0, [r6, #0xc]
	ldr r1, [r4]
	bl _call_via_r1
	cmp r0, #1
	bne _0803C7E2
	ldr r0, [r4]
	bl sub_0803C750
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C7E2
	mov r1, sl
	adds r0, r1, r7
	strb r5, [r0]
	adds r7, #1
_0803C7E2:
	adds r6, #0x18
	movs r0, #0x18
	add sb, r0
	adds r5, #1
	cmp r7, #0x1f
	bgt _0803C7F6
	ldr r1, [r6]
	subs r0, #0x19
	cmp r1, r0
	bne _0803C7BA
_0803C7F6:
	mov r0, sl
	adds r1, r0, r7
	movs r0, #0xff
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C80C: .4byte gUnknown_02027FB0
_0803C810: .4byte gUnknown_0849EDB0

