	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08023A4C
sub_08023A4C: @ 0x08023A4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	movs r2, #0xf
	ands r1, r2
	lsls r7, r1, #6
	ldr r1, _08023B04 @ =gUnknown_08499584
	ands r0, r2
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r1, r1, r0
	mov sl, r1
	movs r0, #0
	mov sb, r0
	ldr r1, _08023B08 @ =gUnknown_080BFBC4
	mov ip, r1
	movs r2, #0x80
	lsls r2, r2, #7
	mov r8, r2
_08023A82:
	ldr r0, _08023B0C @ =gUnknown_08499590
	ldr r3, [r0]
	ldr r0, [sp]
	add r0, sb
	lsls r0, r0, #1
	ldr r2, _08023B10 @ =0x0000417A
	adds r1, r3, r2
	adds r5, r1, r0
	ldrh r0, [r5]
	adds r1, r0, r6
	ldr r2, _08023B14 @ =0x0000234A
	adds r0, r3, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08023B20
	lsls r2, r7, #1
	add r2, sl
	lsls r0, r1, #1
	ldr r1, _08023B18 @ =0x00000A22
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
	ldr r1, _08023B1C @ =gUnknown_080BFBCA
	adds r0, r0, r1
	ldrh r0, [r0]
	add r0, r8
	b _08023B78
	.align 2, 0
_08023B04: .4byte gUnknown_08499584
_08023B08: .4byte gUnknown_080BFBC4
_08023B0C: .4byte gUnknown_08499590
_08023B10: .4byte 0x0000417A
_08023B14: .4byte 0x0000234A
_08023B18: .4byte 0x00000A22
_08023B1C: .4byte gUnknown_080BFBCA
_08023B20:
	lsls r2, r7, #1
	add r2, sl
	lsls r0, r1, #1
	ldr r1, _08023BA4 @ =0x00000A22
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
	ldr r1, _08023BA8 @ =gUnknown_080BFBCA
	adds r0, r0, r1
	ldrh r0, [r0]
_08023B78:
	strh r0, [r2]
	adds r0, r7, #0
	adds r0, #0x40
	lsls r0, r0, #0x16
	lsrs r7, r0, #0x16
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r0, #0xa
	bhi _08023B92
	b _08023A82
_08023B92:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023BA4: .4byte 0x00000A22
_08023BA8: .4byte gUnknown_080BFBCA

