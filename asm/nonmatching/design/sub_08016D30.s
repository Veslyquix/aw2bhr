	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016D30
sub_08016D30: @ 0x08016D30
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	cmp r4, #0
	beq _08016D9C
	ldr r6, _08016DA4 @ =gUnknown_03003FC0
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08016D9C
	bl sub_08016A14
	lsls r5, r4, #0x18
	asrs r4, r5, #0x18
	adds r0, r4, #0
	bl sub_08016CD8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08016D66
	adds r0, r4, #0
	movs r1, #1
	bl sub_08016CEC
_08016D66:
	ldrb r0, [r6, #2]
	adds r0, #0x4c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb
	bhi _08016D82
	ldr r0, _08016DA8 @ =gUnknown_08499590
	ldr r1, [r0]
	ldr r0, _08016DAC @ =0x0000421A
	adds r1, r1, r0
	movs r0, #3
	movs r2, #1
	bl sub_0803CF54
_08016D82:
	adds r0, r7, #0
	bl sub_08016F38
	lsrs r0, r5, #0x18
	ldr r1, _08016DB0 @ =gUnknown_02000000
	ldr r2, _08016DB4 @ =0x00000E28
	bl sub_0801A7D8
	ldrb r0, [r6, #1]
	cmp r0, #1
	bne _08016D9C
	bl sub_08016E74
_08016D9C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016DA4: .4byte gUnknown_03003FC0
_08016DA8: .4byte gUnknown_08499590
_08016DAC: .4byte 0x0000421A
_08016DB0: .4byte gUnknown_02000000
_08016DB4: .4byte 0x00000E28

