	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D3F0
sub_0803D3F0: @ 0x0803D3F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	ldr r2, _0803D478 @ =gUnknown_08499590
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _0803D460
	mov sb, r2
_0803D408:
	movs r3, #0
	mov r2, sb
	ldr r0, [r2]
	adds r6, r1, #1
	mov sl, r6
	ldrh r0, [r0]
	cmp r3, r0
	bge _0803D454
	ldr r4, _0803D478 @ =gUnknown_08499590
	lsls r5, r1, #1
	ldr r0, _0803D47C @ =gUnknown_0849959C
	mov r8, r0
	ldr r2, _0803D480 @ =0x0000417A
	mov ip, r2
	ldr r7, _0803D484 @ =0x00001432
_0803D426:
	ldr r1, [r4]
	mov r6, ip
	adds r0, r1, r6
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r3
	adds r2, r1, r7
	adds r2, r2, r0
	lsls r0, r0, #1
	ldr r6, _0803D488 @ =0x00000A22
	adds r1, r1, r6
	adds r1, r1, r0
	ldrh r1, [r1]
	mov r6, r8
	ldr r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, #1
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r3, r0
	blt _0803D426
_0803D454:
	mov r1, sl
	mov r2, sb
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blt _0803D408
_0803D460:
	bl sub_080219AC
	bl sub_08024268
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D478: .4byte gUnknown_08499590
_0803D47C: .4byte gUnknown_0849959C
_0803D480: .4byte 0x0000417A
_0803D484: .4byte 0x00001432
_0803D488: .4byte 0x00000A22

