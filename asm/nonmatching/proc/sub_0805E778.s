	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805E778
sub_0805E778: @ 0x0805E778
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r2, _0805E824 @ =gUnknown_0816DA7C
	ldr r0, [r2]
	ldr r1, [r0]
	ldrb r0, [r1, #1]
	mov r8, r0
	ldr r0, _0805E828 @ =gUnknown_03003F20
	ldr r7, [r0]
	movs r0, #0x64
	strb r0, [r1, #1]
	movs r1, #0
	mov sb, r1
	mov sl, r2
	add r5, sp, #4
_0805E79E:
	ldr r0, _0805E82C @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r2, _0805E830 @ =0x00002852
	adds r0, r0, r2
	bl sub_0801F92C
	ldr r3, _0805E834 @ =gUnknown_030040D8
	ldr r2, [r3]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	ldrb r2, [r2]
	movs r3, #1
	str r3, [sp]
	ldr r3, _0805E838 @ =gUnknown_030013EC
	ldr r4, [r3]
	movs r3, #0x78
	bl _call_via_r4
	adds r0, r7, #0
	bl sub_0805A0EC
	ldr r1, _0805E83C @ =0xFFFF0000
	ldr r0, [sp, #4]
	ands r0, r1
	ldr r1, _0805E840 @ =0x0000270F
	orrs r0, r1
	str r0, [sp, #4]
	adds r0, r7, #0
	add r1, sp, #4
	bl sub_08059C00
	ldrh r0, [r5]
	ldr r2, _0805E840 @ =0x0000270F
	cmp r0, r2
	beq _0805E862
	mov r3, sl
	ldr r0, [r3]
	ldr r0, [r0]
	movs r6, #0
	mov r1, r8
	strb r1, [r0, #1]
	ldr r1, _0805E844 @ =gUnknown_03003340
	ldrh r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r5]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r2, _0805E834 @ =gUnknown_030040D8
	ldr r0, [r2]
	bl sub_08058224
	cmp r4, r0
	bgt _0805E848
	movs r3, #0
	ldrsh r0, [r5, r3]
	movs r2, #2
	ldrsh r1, [r5, r2]
	str r6, [sp]
	movs r2, #2
	movs r3, #0
	bl sub_0805D648
	b _0805E84E
	.align 2, 0
_0805E824: .4byte gUnknown_0816DA7C
_0805E828: .4byte gUnknown_03003F20
_0805E82C: .4byte gUnknown_08499590
_0805E830: .4byte 0x00002852
_0805E834: .4byte gUnknown_030040D8
_0805E838: .4byte gUnknown_030013EC
_0805E83C: .4byte 0xFFFF0000
_0805E840: .4byte 0x0000270F
_0805E844: .4byte gUnknown_03003340
_0805E848:
	add r0, sp, #4
	bl sub_080591E4
_0805E84E:
	mov r3, sl
	ldr r0, [r3]
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #1]
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #1
	ble _0805E79E
_0805E862:
	mov r2, sl
	ldr r0, [r2]
	ldr r0, [r0]
	mov r3, r8
	strb r3, [r0, #1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

