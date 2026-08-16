	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060F00
sub_08060F00: @ 0x08060F00
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #1
	ldr r0, _08060F28 @ =gUnknown_0816DAE0
	mov r8, r0
	ldr r0, _08060F2C @ =gUnknown_03004640
	adds r5, r0, #2
	movs r7, #0
_08060F12:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r4, [r0, #0x1b]
	cmp r4, #0
	bne _08060F30
	ldrh r0, [r5]
	movs r0, #0xff
	b _08060F5A
	.align 2, 0
_08060F28: .4byte gUnknown_0816DAE0
_08060F2C: .4byte gUnknown_03004640
_08060F30:
	adds r0, r6, #0
	bl sub_08057FA8
	adds r1, r0, #0
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _08060F70 @ =gUnknown_03004674
	ldr r1, [r1]
	bl __divsi3
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r4, #0
	bl __divsi3
	ldrh r1, [r5]
_08060F5A:
	strh r0, [r5]
	adds r5, #2
	adds r7, #0xc
	adds r6, #1
	cmp r6, #0x18
	ble _08060F12
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060F70: .4byte gUnknown_03004674

