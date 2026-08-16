	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057AE8
sub_08057AE8: @ 0x08057AE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08057B9C @ =gUnknown_0816CABC
	ldr r1, _08057BA0 @ =0x06004000
	bl Decompress
	ldr r5, _08057BA4 @ =gUnknown_0816D498
	ldr r4, _08057BA8 @ =gUnknown_03004500
	ldrb r0, [r4]
	lsls r0, r0, #5
	adds r0, r0, r5
	ldr r1, _08057BAC @ =0x05000140
	movs r2, #8
	bl CpuFastSet
	ldrb r0, [r4, #1]
	lsls r0, r0, #5
	adds r0, r0, r5
	ldr r1, _08057BB0 @ =0x05000120
	movs r2, #8
	bl CpuFastSet
	bl sub_08013C00
	movs r6, #0
	ldr r0, _08057BB4 @ =gUnknown_081361A0
	mov sl, r0
	ldr r2, _08057BB8 @ =gUnknown_081361A4
	mov sb, r2
	ldr r0, _08057BBC @ =gUnknown_081361A8
	mov r8, r0
	ldr r7, _08057BC0 @ =gUnknown_081361AC
_08057B2E:
	ldr r1, _08057BC4 @ =gUnknown_030005E8
	lsls r3, r6, #1
	adds r1, r3, r1
	movs r0, #0
	strh r0, [r1]
	mov r0, sl
	ldr r2, [r0]
	lsls r4, r6, #2
	adds r2, r4, r2
	mov r0, sb
	ldr r1, [r0]
	adds r1, r3, r1
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	str r0, [r2]
	mov r2, r8
	ldr r0, [r2]
	adds r3, r3, r0
	ldrh r0, [r1]
	ldrh r1, [r3]
	subs r0, r0, r1
	ldr r1, [r7]
	adds r4, r4, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r5, r0, #0x10
	movs r1, #5
	bl __divsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r1, #0x14
	adds r0, r5, #0
	bl __divsi3
	str r0, [r4]
	adds r6, #1
	cmp r6, #1
	ble _08057B2E
	ldr r4, _08057BC8 @ =gUnknown_08499578
	ldr r0, [r4]
	bl sub_080579B8
	ldr r0, [r4]
	bl sub_08057A80
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057B9C: .4byte gUnknown_0816CABC
_08057BA0: .4byte 0x06004000
_08057BA4: .4byte gUnknown_0816D498
_08057BA8: .4byte gUnknown_03004500
_08057BAC: .4byte 0x05000140
_08057BB0: .4byte 0x05000120
_08057BB4: .4byte gUnknown_081361A0
_08057BB8: .4byte gUnknown_081361A4
_08057BBC: .4byte gUnknown_081361A8
_08057BC0: .4byte gUnknown_081361AC
_08057BC4: .4byte gUnknown_030005E8
_08057BC8: .4byte gUnknown_08499578

