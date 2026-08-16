	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08062DF0
sub_08062DF0: @ 0x08062DF0
	push {r4, r5, r6, lr}
	movs r5, #0
	movs r6, #0
	bl sub_08023824
	bl sub_0802361C
	movs r0, #4
	bl sub_08023908
	movs r0, #0
	bl sub_08023274
	ldr r0, _08062E3C @ =gUnknown_08499590
	ldr r3, [r0]
	ldrh r1, [r3, #0x10]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08062E1A
	b _08062F7A
_08062E1A:
	ldr r0, _08062E40 @ =gpKeySt
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	cmp r0, #1
	bne _08062E4C
	ldr r0, _08062E44 @ =gUnknown_03004780
	ldr r1, _08062E48 @ =gUnknown_030045DC
	ldrh r1, [r1]
	strh r1, [r0]
	bl sub_08024584
	bl sub_08013C00
	bl sub_08013AEC
	b _08062F84
	.align 2, 0
_08062E3C: .4byte gUnknown_08499590
_08062E40: .4byte gpKeySt
_08062E44: .4byte gUnknown_03004780
_08062E48: .4byte gUnknown_030045DC
_08062E4C:
	ldrh r1, [r1]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08062E58
	b _08062F7A
_08062E58:
	ldr r2, _08062F8C @ =gUnknown_030033E4
	ldrh r1, [r2, #2]
	lsls r1, r1, #1
	ldr r4, _08062F90 @ =0x0000417A
	adds r0, r3, r4
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x12
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _08062E78
	b _08062F7A
_08062E78:
	ldr r0, _08062F94 @ =gUnknown_03003F38
	strb r1, [r0]
	ldr r4, _08062F98 @ =gUnknown_030040D8
	ldr r2, _08062F9C @ =gUnknown_08499594
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, [r2]
	adds r3, r2, r0
	str r3, [r4]
	ldrb r0, [r3, #7]
	cmp r0, #0
	beq _08062E9E
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, r2, r0
_08062E9E:
	ldrb r0, [r3, #8]
	cmp r0, #0
	beq _08062EAE
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r6, r2, r0
_08062EAE:
	ldr r2, _08062FA0 @ =gUnknown_0816DB40
	movs r0, #2
	movs r1, #4
	bl sub_08013428
	ldr r2, _08062FA4 @ =gUnknown_0816DB50
	ldr r0, [r4]
	ldrb r3, [r0, #9]
	lsls r3, r3, #0x1d
	lsrs r3, r3, #0x1d
	movs r0, #2
	movs r1, #5
	bl sub_08013428
	ldr r2, _08062FA8 @ =gUnknown_0816DB5C
	ldr r0, [r4]
	ldrb r3, [r0, #9]
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1d
	movs r0, #2
	movs r1, #6
	bl sub_08013428
	ldr r2, _08062FAC @ =gUnknown_0816DB68
	ldr r0, [r4]
	ldrb r3, [r0, #9]
	lsrs r3, r3, #6
	movs r0, #2
	movs r1, #7
	bl sub_08013428
	ldr r2, _08062FB0 @ =gUnknown_0816DB74
	ldr r0, [r4]
	ldrb r3, [r0, #0xb]
	movs r0, #2
	movs r1, #8
	bl sub_08013428
	cmp r5, #0
	beq _08062F3A
	ldr r4, _08062FB4 @ =gUnknown_0816DB80
	ldrb r3, [r5, #9]
	lsls r3, r3, #0x1d
	lsrs r3, r3, #0x1d
	movs r0, #9
	movs r1, #5
	adds r2, r4, #0
	bl sub_08013428
	ldrb r3, [r5, #9]
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1d
	movs r0, #9
	movs r1, #6
	adds r2, r4, #0
	bl sub_08013428
	ldrb r3, [r5, #9]
	lsrs r3, r3, #6
	movs r0, #9
	movs r1, #7
	adds r2, r4, #0
	bl sub_08013428
	ldrb r3, [r5, #0xb]
	movs r0, #9
	movs r1, #8
	adds r2, r4, #0
	bl sub_08013428
_08062F3A:
	cmp r6, #0
	beq _08062F7A
	ldr r4, _08062FB4 @ =gUnknown_0816DB80
	ldrb r3, [r6, #9]
	lsls r3, r3, #0x1d
	lsrs r3, r3, #0x1d
	movs r0, #0xe
	movs r1, #5
	adds r2, r4, #0
	bl sub_08013428
	ldrb r3, [r6, #9]
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1d
	movs r0, #0xe
	movs r1, #6
	adds r2, r4, #0
	bl sub_08013428
	ldrb r3, [r6, #9]
	lsrs r3, r3, #6
	movs r0, #0xe
	movs r1, #7
	adds r2, r4, #0
	bl sub_08013428
	ldrb r3, [r6, #0xb]
	movs r0, #0xe
	movs r1, #8
	adds r2, r4, #0
	bl sub_08013428
_08062F7A:
	bl sub_0802A7C4
	movs r0, #0
	bl sub_0802776C
_08062F84:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062F8C: .4byte gUnknown_030033E4
_08062F90: .4byte 0x0000417A
_08062F94: .4byte gUnknown_03003F38
_08062F98: .4byte gUnknown_030040D8
_08062F9C: .4byte gUnknown_08499594
_08062FA0: .4byte gUnknown_0816DB40
_08062FA4: .4byte gUnknown_0816DB50
_08062FA8: .4byte gUnknown_0816DB5C
_08062FAC: .4byte gUnknown_0816DB68
_08062FB0: .4byte gUnknown_0816DB74
_08062FB4: .4byte gUnknown_0816DB80

