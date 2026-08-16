	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060F74
sub_08060F74: @ 0x08060F74
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r5, #1
	ldr r0, _08060FE8 @ =gUnknown_0816DAE4
	mov r8, r0
	ldr r7, _08060FEC @ =gUnknown_030033EC
	ldr r0, _08060FF0 @ =gUnknown_03004640
	adds r4, r0, #2
	movs r6, #0xff
_08060F88:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldrb r0, [r0]
	bl sub_08060ED4
	cmp r0, #0
	beq _08060FBA
	ldrh r0, [r7]
	adds r1, r5, #0
	bl sub_08042C9C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrh r2, [r7]
	ldr r0, _08060FF4 @ =gUnknown_08499598
	ldr r3, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r1, r0
	bls _08060FBE
_08060FBA:
	ldrh r0, [r4]
	strh r6, [r4]
_08060FBE:
	adds r0, r5, #0
	subs r0, #0xf
	cmp r0, #1
	bhi _08060FD6
	ldr r0, _08060FF8 @ =gUnknown_030045C0
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08060FD6
	ldrh r0, [r4]
	strh r6, [r4]
_08060FD6:
	adds r4, #2
	adds r5, #1
	cmp r5, #0x18
	ble _08060F88
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060FE8: .4byte gUnknown_0816DAE4
_08060FEC: .4byte gUnknown_030033EC
_08060FF0: .4byte gUnknown_03004640
_08060FF4: .4byte gUnknown_08499598
_08060FF8: .4byte gUnknown_030045C0

