	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08023BAC
sub_08023BAC: @ 0x08023BAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #4]
	movs r2, #0xf
	ands r0, r2
	lsls r7, r0, #1
	ldr r0, _08023C68 @ =gUnknown_08499584
	ands r1, r2
	lsls r1, r1, #7
	ldr r0, [r0]
	adds r0, r0, r1
	mov sl, r0
	movs r0, #0
	mov sb, r0
	ldr r1, _08023C6C @ =gUnknown_080BFBC4
	mov ip, r1
	movs r2, #0x80
	lsls r2, r2, #7
	mov r8, r2
_08023BE4:
	ldr r0, _08023C70 @ =gUnknown_08499590
	ldr r3, [r0]
	ldr r0, [sp, #4]
	lsls r1, r0, #1
	ldr r2, _08023C74 @ =0x0000417A
	adds r0, r3, r2
	adds r5, r0, r1
	ldrh r0, [r5]
	ldr r6, [sp]
	add r6, sb
	adds r1, r0, r6
	ldr r2, _08023C78 @ =0x0000234A
	adds r0, r3, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08023C84
	lsls r2, r7, #1
	add r2, sl
	lsls r0, r1, #1
	ldr r1, _08023C7C @ =0x00000A22
	adds r3, r3, r1
	adds r0, r3, r0
	ldrh r0, [r0]
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r2]
	ldrh r0, [r5]
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	lsls r0, r0, #3
	mov r1, ip
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r2, #2]
	adds r4, r2, #0
	adds r4, #0x40
	ldrh r0, [r5]
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	lsls r0, r0, #3
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r4]
	adds r2, #0x42
	ldrh r0, [r5]
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r3, r3, r0
	ldrh r0, [r3]
	lsls r0, r0, #3
	ldr r1, _08023C80 @ =gUnknown_080BFBCA
	adds r0, r0, r1
	ldrh r0, [r0]
	add r0, r8
	b _08023CDC
	.align 2, 0
_08023C68: .4byte gUnknown_08499584
_08023C6C: .4byte gUnknown_080BFBC4
_08023C70: .4byte gUnknown_08499590
_08023C74: .4byte 0x0000417A
_08023C78: .4byte 0x0000234A
_08023C7C: .4byte 0x00000A22
_08023C80: .4byte gUnknown_080BFBCA
_08023C84:
	lsls r2, r7, #1
	add r2, sl
	lsls r0, r1, #1
	ldr r1, _08023D0C @ =0x00000A22
	adds r3, r3, r1
	adds r0, r3, r0
	ldrh r0, [r0]
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r5]
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	lsls r0, r0, #3
	mov r1, ip
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #2]
	adds r4, r2, #0
	adds r4, #0x40
	ldrh r0, [r5]
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	lsls r0, r0, #3
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4]
	adds r2, #0x42
	ldrh r0, [r5]
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r3, r3, r0
	ldrh r0, [r3]
	lsls r0, r0, #3
	ldr r1, _08023D10 @ =gUnknown_080BFBCA
	adds r0, r0, r1
	ldrh r0, [r0]
_08023CDC:
	strh r0, [r2]
	adds r0, r7, #2
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0xd
	ands r1, r0
	lsrs r7, r1, #0x10
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r0, #0xf
	bhi _08023CFA
	b _08023BE4
_08023CFA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023D0C: .4byte 0x00000A22
_08023D10: .4byte gUnknown_080BFBCA

