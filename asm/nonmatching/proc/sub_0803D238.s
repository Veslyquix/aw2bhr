	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D238
sub_0803D238: @ 0x0803D238
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	ldr r5, _0803D2E0 @ =gUnknown_08091148
	ldr r0, [r5]
	ldrh r0, [r0]
	str r0, [sp]
	ldr r4, _0803D2E4 @ =gUnknown_0809114C
	ldr r0, [r4]
	ldrh r0, [r0]
	str r0, [sp, #4]
	bl sub_08025E74
	movs r6, #0
	movs r1, #0
	ldr r2, _0803D2E8 @ =gUnknown_08499590
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _0803D2BE
	adds r7, r2, #0
_0803D26A:
	movs r4, #0
	ldr r0, [r7]
	adds r2, r1, #1
	mov r8, r2
	ldrh r0, [r0]
	cmp r4, r0
	bge _0803D2B4
	ldr r0, _0803D2EC @ =gUnknown_030033EC
	mov sb, r0
	lsls r5, r1, #0x10
_0803D27E:
	ldr r0, _0803D2F0 @ =0x000004CB
	add r0, sl
	adds r0, r0, r6
	ldrb r3, [r0]
	lsls r1, r3, #0x18
	cmp r1, #0
	beq _0803D2A8
	lsrs r1, r1, #0x1e
	adds r0, r1, #1
	mov r2, sb
	strh r0, [r2]
	ldr r0, _0803D2F4 @ =gUnknown_03003F2C
	lsls r1, r1, #6
	strh r1, [r0]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x3f
	ands r2, r3
	asrs r1, r5, #0x10
	bl sub_08025CC8
_0803D2A8:
	adds r6, #1
	adds r4, #1
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r4, r0
	blt _0803D27E
_0803D2B4:
	mov r1, r8
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blt _0803D26A
_0803D2BE:
	ldr r0, _0803D2EC @ =gUnknown_030033EC
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0]
	ldr r0, _0803D2F4 @ =gUnknown_03003F2C
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r0]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D2E0: .4byte gUnknown_08091148
_0803D2E4: .4byte gUnknown_0809114C
_0803D2E8: .4byte gUnknown_08499590
_0803D2EC: .4byte gUnknown_030033EC
_0803D2F0: .4byte 0x000004CB
_0803D2F4: .4byte gUnknown_03003F2C

