	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D2F8
sub_0803D2F8: @ 0x0803D2F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r1
	ldr r1, _0803D3B8 @ =0x000004B2
	add r1, r8
	bl sub_0803CC84
	ldr r2, _0803D3BC @ =gUnknown_08091150
	ldr r0, [r2]
	ldr r0, [r0]
	ldr r1, _0803D3C0 @ =0x000004C3
	add r1, r8
	ldrb r1, [r1]
	ldr r3, _0803D3C4 @ =0x00004233
	adds r0, r0, r3
	strb r1, [r0]
	movs r4, #0
	ldr r5, _0803D3C8 @ =gUnknown_03003FF3
	ldr r3, _0803D3CC @ =0x000004C4
	add r3, r8
_0803D328:
	adds r0, r4, r5
	adds r1, r3, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, #1
	cmp r4, #4
	ble _0803D328
	ldr r4, [r2]
	ldr r1, [r4]
	mov r5, r8
	ldrb r0, [r5]
	strh r0, [r1]
	ldrb r0, [r5, #1]
	strh r0, [r1, #2]
	bl sub_080215FC
	movs r7, #0
	movs r1, #0
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _0803D3A8
	adds r6, r4, #0
_0803D356:
	movs r4, #0
	ldr r0, [r6]
	adds r2, r1, #1
	mov ip, r2
	ldrh r0, [r0]
	cmp r4, r0
	bge _0803D39E
	lsls r1, r1, #1
	str r1, [sp]
	ldr r3, _0803D3D0 @ =0x0000417A
	mov sl, r3
	ldr r5, _0803D3D4 @ =0x00000A22
	mov sb, r5
	lsls r0, r7, #1
	adds r0, #2
	mov r1, r8
	adds r3, r0, r1
_0803D378:
	ldr r2, [r6]
	mov r5, sl
	adds r0, r2, r5
	ldr r1, [sp]
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	mov r5, sb
	adds r1, r2, r5
	adds r1, r1, r0
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r7, #1
	adds r4, #1
	ldrh r2, [r2]
	cmp r4, r2
	blt _0803D378
_0803D39E:
	mov r1, ip
	ldr r0, [r6]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blt _0803D356
_0803D3A8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D3B8: .4byte 0x000004B2
_0803D3BC: .4byte gUnknown_08091150
_0803D3C0: .4byte 0x000004C3
_0803D3C4: .4byte 0x00004233
_0803D3C8: .4byte gUnknown_03003FF3
_0803D3CC: .4byte 0x000004C4
_0803D3D0: .4byte 0x0000417A
_0803D3D4: .4byte 0x00000A22

