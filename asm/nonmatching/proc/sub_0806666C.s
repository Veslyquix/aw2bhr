	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806666C
sub_0806666C: @ 0x0806666C
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r1, _080666CC @ =gUnknown_08580934
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	cmp r4, r0
	bge _0806670A
	adds r5, r1, #0
	ldr r2, _080666D0 @ =gUnknown_03002040
	movs r6, #0
_08066680:
	ldr r3, [r5]
	adds r0, r3, #0
	adds r0, #0x70
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080666D4
	ldrh r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080666D4
	adds r0, r3, #0
	adds r0, #0x44
	adds r0, r0, r6
	ldr r0, [r0]
	movs r2, #0x28
	ldrsh r1, [r0, r2]
	movs r5, #0x2a
	ldrsh r2, [r0, r5]
	adds r0, r3, #0
	adds r0, #0x11
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r1, #1
	adds r2, #8
	adds r0, r4, #0
	bl sub_08066580
	movs r0, #0x71
	bl sub_0803B4DC
	b _0806670A
	.align 2, 0
_080666CC: .4byte gUnknown_08580934
_080666D0: .4byte gUnknown_03002040
_080666D4:
	ldr r0, [r5]
	adds r0, #0x70
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080666FC
	ldrh r1, [r2, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080666FC
	adds r0, r4, #0
	bl sub_080665BC
	movs r0, #0x66
	bl sub_0803B4DC
	b _0806670A
_080666FC:
	adds r2, #0x14
	adds r6, #4
	adds r4, #1
	ldr r0, [r5]
	ldrb r0, [r0, #8]
	cmp r4, r0
	blt _08066680
_0806670A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

