	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08021750
sub_08021750: @ 0x08021750
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r0, #0x4c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _080217F8 @ =gUnknown_08499590
	ldr r1, [r4]
	ldr r2, _080217FC @ =0x0000421A
	adds r1, r1, r2
	bl sub_0803CF3C
	ldr r1, [r4]
	movs r0, #0
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	strh r0, [r1, #8]
	strh r0, [r1, #0xa]
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	strh r0, [r1, #0x10]
	movs r2, #0
	ldrh r1, [r1, #2]
	cmp r2, r1
	bge _080217E6
	mov sl, r4
_0802178A:
	movs r4, #0
	mov r7, sl
	ldr r0, [r7]
	adds r1, r2, #1
	str r1, [sp]
	ldrh r0, [r0]
	cmp r4, r0
	bge _080217DA
	ldr r5, _080217F8 @ =gUnknown_08499590
	lsls r6, r2, #1
	ldr r2, _08021800 @ =gUnknown_0849959C
	mov sb, r2
	ldr r7, _08021804 @ =0x0000417A
	mov r8, r7
	ldr r0, _08021808 @ =0x00000A22
	mov ip, r0
_080217AA:
	ldr r1, [r5]
	mov r2, r8
	adds r0, r1, r2
	adds r0, r0, r6
	ldrh r2, [r0]
	adds r2, r2, r4
	lsls r3, r2, #1
	mov r7, ip
	adds r0, r1, r7
	adds r0, r0, r3
	ldrh r3, [r0]
	ldr r0, _0802180C @ =0x00001432
	adds r1, r1, r0
	adds r1, r1, r2
	mov r2, sb
	ldr r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r4, #1
	ldr r0, [r5]
	ldrh r0, [r0]
	cmp r4, r0
	blt _080217AA
_080217DA:
	ldr r2, [sp]
	mov r7, sl
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	cmp r2, r0
	blt _0802178A
_080217E6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080217F8: .4byte gUnknown_08499590
_080217FC: .4byte 0x0000421A
_08021800: .4byte gUnknown_0849959C
_08021804: .4byte 0x0000417A
_08021808: .4byte 0x00000A22
_0802180C: .4byte 0x00001432

