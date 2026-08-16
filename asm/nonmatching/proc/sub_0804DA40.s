	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804DA40
sub_0804DA40: @ 0x0804DA40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	mov r8, r1
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r4, sp
	adds r0, r5, #0
	mov r1, sp
	bl sub_0801566C
	ldrh r4, [r4, #4]
	lsls r4, r4, #0x16
	lsrs r0, r4, #0x16
	mov r1, r8
	ldrh r1, [r1, #4]
	mov sl, r1
	mov r2, sl
	subs r7, r2, r0
	ldr r3, _0804DB00 @ =0x000003FF
	adds r0, r3, #0
	ands r7, r0
	adds r0, r7, #0
	movs r1, #0x38
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	adds r0, r7, #0
	movs r1, #0x38
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0804DB04 @ =gUnknown_03001470
	mov ip, r1
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r6, r1, #5
	mov r1, ip
	adds r1, #0x30
	adds r1, r6, r1
	ldrh r2, [r1]
	movs r1, #0xfc
	lsls r1, r1, #8
	mov r3, sl
	ands r1, r3
	adds r0, r0, r1
	lsrs r4, r4, #0x16
	adds r4, r4, r0
	mov r0, r8
	strh r4, [r0, #4]
	ldr r1, _0804DB08 @ =gUnknown_02029668
	lsls r3, r2, #2
	adds r0, r3, r2
	lsls r0, r0, #1
	adds r1, #6
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r5, r0
	bne _0804DAF0
	mov r0, ip
	adds r0, #0x28
	adds r0, r6, r0
	ldr r0, [r0]
	cmp r7, r0
	beq _0804DAF0
	ldr r0, _0804DB0C @ =gUnknown_08552FB0
	adds r0, r3, r0
	mov r3, sb
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #8
	ldr r0, [r0]
	adds r0, r0, r1
	lsls r1, r2, #0xd
	ldr r2, _0804DB10 @ =0x06010C00
	adds r1, r1, r2
	movs r2, #0xe0
	lsls r2, r2, #3
	bl sub_08011E54
_0804DAF0:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DB00: .4byte 0x000003FF
_0804DB04: .4byte gUnknown_03001470
_0804DB08: .4byte gUnknown_02029668
_0804DB0C: .4byte gUnknown_08552FB0
_0804DB10: .4byte 0x06010C00

