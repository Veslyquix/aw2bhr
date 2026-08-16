	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805A744
sub_0805A744: @ 0x0805A744
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r5, _0805A834 @ =gUnknown_0816D99C
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, _0805A838 @ =0x00003C72
	adds r0, r0, r1
	movs r1, #0x7f
	bl sub_080581A4
	ldr r0, [r4]
	ldr r2, _0805A83C @ =0x00002852
	adds r0, r0, r2
	bl sub_0801F92C
	movs r3, #2
	ldrsh r0, [r6, r3]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0805A824
_0805A778:
	ldr r2, _0805A840 @ =gUnknown_030013EC
	ldrb r0, [r6]
	ldrb r1, [r6, #1]
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [sp]
	ldr r4, [r2]
	movs r2, #0x17
	movs r3, #0x78
	bl _call_via_r4
	movs r1, #0
	ldr r2, _0805A844 @ =gUnknown_08499590
	ldr r0, [r2]
	adds r6, #4
	str r6, [sp, #4]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _0805A816
	mov sl, r2
_0805A7A0:
	movs r5, #0
	mov r2, sl
	ldr r0, [r2]
	adds r3, r1, #1
	mov sb, r3
	ldrh r0, [r0]
	cmp r5, r0
	bge _0805A80A
	lsls r0, r1, #2
	ldr r2, _0805A848 @ =gUnknown_03003340
	adds r0, r0, r2
	mov r8, r0
	ldr r7, _0805A844 @ =gUnknown_08499590
	lsls r1, r1, #1
	mov ip, r1
_0805A7BE:
	mov r3, r8
	ldr r0, [r3]
	adds r3, r0, r5
	ldrb r6, [r3]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	blt _0805A800
	ldr r2, [r7]
	ldr r1, _0805A84C @ =0x0000417A
	adds r0, r2, r1
	add r0, ip
	ldrh r0, [r0]
	adds r4, r0, r5
	ldr r1, _0805A850 @ =0x00001432
	adds r0, r2, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0xd
	beq _0805A7EE
	cmp r1, #0xb
	bne _0805A800
_0805A7EE:
	movs r1, #0
	ldrsb r1, [r3, r1]
	ldr r3, _0805A838 @ =0x00003C72
	adds r0, r2, r3
	adds r0, r0, r4
	ldrb r2, [r0]
	cmp r1, r2
	bge _0805A800
	strb r6, [r0]
_0805A800:
	adds r5, #1
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r5, r0
	blt _0805A7BE
_0805A80A:
	mov r1, sb
	mov r3, sl
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blt _0805A7A0
_0805A816:
	ldr r6, [sp, #4]
	movs r1, #2
	ldrsh r0, [r6, r1]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _0805A778
_0805A824:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A834: .4byte gUnknown_0816D99C
_0805A838: .4byte 0x00003C72
_0805A83C: .4byte 0x00002852
_0805A840: .4byte gUnknown_030013EC
_0805A844: .4byte gUnknown_08499590
_0805A848: .4byte gUnknown_03003340
_0805A84C: .4byte 0x0000417A
_0805A850: .4byte 0x00001432

