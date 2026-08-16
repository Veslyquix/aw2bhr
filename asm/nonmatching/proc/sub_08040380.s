	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040380
sub_08040380: @ 0x08040380
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r0, _08040420 @ =gUnknown_08499590
	mov sl, r0
	ldr r1, [r0]
	lsls r2, r6, #1
	mov sb, r2
	ldr r2, _08040424 @ =0x0000417A
	adds r0, r1, r2
	add r0, sb
	ldrh r0, [r0]
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r2, _08040428 @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r5, [r1]
	movs r4, #0xe5
	lsls r4, r4, #1
	adds r0, r4, #0
	movs r1, #5
	bl sub_08040430
	mov r0, r8
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #5
	bl sub_0804046C
	movs r0, #0xc0
	lsls r0, r0, #1
	cmp r5, r0
	bne _08040408
	mov r2, sl
	ldr r1, [r2]
	ldr r2, _08040424 @ =0x0000417A
	adds r0, r1, r2
	add r0, sb
	ldrh r0, [r0]
	adds r0, r0, r7
	ldr r2, _0804042C @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	movs r0, #0x12
	strb r0, [r1]
	mov r0, sl
	ldr r1, [r0]
	ldr r2, _08040424 @ =0x0000417A
	adds r0, r1, r2
	add r0, sb
	ldrh r0, [r0]
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r2, _08040428 @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	movs r0, #0xd0
	lsls r0, r0, #1
	strh r0, [r1]
_08040408:
	bl sub_08021CB4
	bl sub_08024268
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040420: .4byte gUnknown_08499590
_08040424: .4byte 0x0000417A
_08040428: .4byte 0x00000A22
_0804042C: .4byte 0x00001432

