	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805BB8C
sub_0805BB8C: @ 0x0805BB8C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _0805BBE4 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r7, #1
	ldr r3, _0805BBE8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r6
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805BBE0
	subs r0, r6, #1
	adds r1, r7, #0
	bl sub_0805BBF8
	adds r4, r0, #0
	adds r0, r6, #1
	adds r1, r7, #0
	bl sub_0805BBF8
	mov r8, r0
	subs r1, r7, #1
	adds r0, r6, #0
	bl sub_0805BBF8
	adds r5, r0, #0
	adds r1, r7, #1
	adds r0, r6, #0
	bl sub_0805BBF8
	add r4, r8
	adds r4, r4, r5
	adds r4, r4, r0
	cmp r4, #0
	bgt _0805BBEC
_0805BBE0:
	movs r0, #0
	b _0805BBEE
	.align 2, 0
_0805BBE4: .4byte gUnknown_08499590
_0805BBE8: .4byte 0x0000417A
_0805BBEC:
	movs r0, #1
_0805BBEE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

