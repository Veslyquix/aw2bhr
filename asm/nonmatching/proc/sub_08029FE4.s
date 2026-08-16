	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029FE4
sub_08029FE4: @ 0x08029FE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0802A0C8 @ =gUnknown_0849A0A8
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0802A004
	b _0802A1D0
_0802A004:
	ldr r3, _0802A0CC @ =gUnknown_08090B74
	ldr r4, [r3]
	ldr r2, _0802A0D0 @ =gUnknown_08090B78
	ldr r0, [r2]
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r4
	ldrh r7, [r0, #0x38]
	cmp r7, #0x32
	bls _0802A020
	b _0802A1C0
_0802A020:
	ldr r0, _0802A0D4 @ =gUnknown_03004007
	mov sl, r0
_0802A024:
	ldr r2, _0802A0D8 @ =gUnknown_08499594
	ldr r0, _0802A0DC @ =gUnknown_03003F2C
	ldrh r0, [r0]
	adds r0, r0, r7
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r2]
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0802A03E
	b _0802A1B4
_0802A03E:
	ldrb r1, [r4, #1]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0802A04A
	b _0802A1B4
_0802A04A:
	ldr r0, _0802A0E0 @ =gUnknown_08499590
	ldr r3, [r0]
	ldrb r1, [r4, #3]
	lsls r1, r1, #1
	ldr r2, _0802A0E4 @ =0x0000417A
	adds r0, r3, r2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r4, #2]
	adds r6, r1, r0
	ldr r5, _0802A0E8 @ =0x00001432
	adds r0, r3, r5
	adds r0, r0, r6
	ldrb r5, [r0]
	movs r0, #0xe0
	ldr r1, _0802A0EC @ =gUnknown_03004084
	ands r0, r5
	ldrh r1, [r1]
	cmp r0, r1
	beq _0802A074
	b _0802A1B4
_0802A074:
	ldr r1, _0802A0F0 @ =gUnknown_085D5ABC
	ldrb r2, [r4]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r1, #0x54
	adds r0, r0, r1
	movs r1, #0x1f
	ands r1, r5
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802A094
	b _0802A1B4
_0802A094:
	ldr r1, _0802A0F4 @ =0x0000234A
	adds r0, r3, r1
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802A0F8
	adds r0, r4, #0
	movs r1, #0
	bl sub_08029978
	adds r0, r4, #0
	movs r1, #0
	bl sub_08029A48
	mov r2, sl
	ldrb r0, [r2]
	movs r2, #1
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	movs r1, #2
	bl sub_08029AF8
	b _0802A1B4
	.align 2, 0
_0802A0C8: .4byte gUnknown_0849A0A8
_0802A0CC: .4byte gUnknown_08090B74
_0802A0D0: .4byte gUnknown_08090B78
_0802A0D4: .4byte gUnknown_03004007
_0802A0D8: .4byte gUnknown_08499594
_0802A0DC: .4byte gUnknown_03003F2C
_0802A0E0: .4byte gUnknown_08499590
_0802A0E4: .4byte 0x0000417A
_0802A0E8: .4byte 0x00001432
_0802A0EC: .4byte gUnknown_03004084
_0802A0F0: .4byte gUnknown_085D5ABC
_0802A0F4: .4byte 0x0000234A
_0802A0F8:
	ldr r3, _0802A19C @ =gUnknown_030033EC
	mov r8, r3
	ldrh r1, [r3]
	ldr r5, _0802A1A0 @ =gUnknown_08499598
	mov sb, r5
	ldr r2, [r5]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r6, [r0]
	adds r0, r4, #0
	movs r1, #0
	bl sub_08029978
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_08029A48
	adds r5, r5, r0
	mov r1, sl
	ldrb r0, [r1]
	movs r2, #1
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	movs r1, #2
	bl sub_08029AF8
	adds r3, r0, #0
	cmp r5, #0
	bne _0802A140
	cmp r3, #0
	beq _0802A1B4
_0802A140:
	movs r2, #0
	mov ip, r2
	cmp r3, #0
	beq _0802A160
	movs r5, #1
	mov ip, r5
	mov r1, r8
	ldrh r0, [r1]
	mov r5, sb
	ldr r2, [r5]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	str r6, [r1]
	movs r5, #0
_0802A160:
	ldrb r2, [r4, #2]
	ldr r1, _0802A1A4 @ =0xFFFF0000
	ldr r0, [sp]
	ands r0, r1
	orrs r0, r2
	str r0, [sp]
	ldrb r2, [r4, #3]
	lsls r2, r2, #0x10
	ldr r1, _0802A1A8 @ =0x0000FFFF
	ands r0, r1
	orrs r0, r2
	str r0, [sp]
	mov r0, r8
	ldrb r1, [r0]
	adds r2, r3, r5
	mov r0, sp
	mov r3, ip
	bl sub_08029CB8
	ldr r2, _0802A1AC @ =gUnknown_03001470
	ldr r0, _0802A1B0 @ =gUnknown_03001FBC
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	adds r1, r7, #1
	strh r1, [r0, #0x38]
	b _0802A1C0
	.align 2, 0
_0802A19C: .4byte gUnknown_030033EC
_0802A1A0: .4byte gUnknown_08499598
_0802A1A4: .4byte 0xFFFF0000
_0802A1A8: .4byte 0x0000FFFF
_0802A1AC: .4byte gUnknown_03001470
_0802A1B0: .4byte gUnknown_03001FBC
_0802A1B4:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0x32
	bhi _0802A1C0
	b _0802A024
_0802A1C0:
	cmp r7, #0x33
	bne _0802A1D0
	bl sub_08029FC4
	ldr r0, _0802A1E0 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_0802A1D0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A1E0: .4byte gUnknown_03001FBC

