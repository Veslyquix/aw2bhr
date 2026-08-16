	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080402B4
sub_080402B4: @ 0x080402B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r3, r2, #0
	ldr r6, _08040368 @ =gUnknown_08499590
	ldr r2, [r6]
	lsls r5, r1, #1
	ldr r0, _0804036C @ =0x0000417A
	mov r8, r0
	adds r0, r2, r0
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r7, _08040370 @ =0x00000A22
	mov sb, r7
	add r2, sb
	adds r2, r2, r0
	ldrh r0, [r2]
	adds r7, r0, #0
	movs r2, #3
	rsbs r2, r2, #0
	adds r0, r4, #0
	bl sub_0803FF48
	movs r0, #0xb1
	lsls r0, r0, #1
	cmp r7, r0
	bne _08040322
	ldr r1, [r6]
	ldr r2, _0804036C @ =0x0000417A
	adds r0, r1, r2
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _08040374 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	ldr r1, [r6]
	ldr r2, _0804036C @ =0x0000417A
	adds r0, r1, r2
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _08040370 @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	movs r0, #0x91
	lsls r0, r0, #1
	strh r0, [r1]
_08040322:
	ldr r0, _08040378 @ =0x00000163
	cmp r7, r0
	bne _08040352
	ldr r1, [r6]
	mov r7, r8
	adds r0, r1, r7
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _08040374 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	ldr r1, [r6]
	adds r0, r1, r7
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	add r1, sb
	adds r1, r1, r0
	ldr r0, _0804037C @ =0x00000123
	strh r0, [r1]
_08040352:
	bl sub_08024268
	bl sub_080219AC
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040368: .4byte gUnknown_08499590
_0804036C: .4byte 0x0000417A
_08040370: .4byte 0x00000A22
_08040374: .4byte 0x00001432
_08040378: .4byte 0x00000163
_0804037C: .4byte 0x00000123

