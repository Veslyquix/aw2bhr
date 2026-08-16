	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080665D4
sub_080665D4: @ 0x080665D4
	push {r4, r5, r6, lr}
	movs r3, #0
	ldr r1, _08066628 @ =gUnknown_08580934
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	cmp r3, r0
	bge _08066666
	adds r5, r1, #0
	ldr r4, _0806662C @ =gUnknown_03002040
	movs r6, #0
_080665E8:
	ldr r2, [r5]
	adds r0, r2, #0
	adds r0, #0x70
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08066630
	ldrh r1, [r4, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08066630
	adds r0, r2, #0
	adds r0, #0x34
	adds r0, r0, r6
	ldr r0, [r0]
	movs r2, #0x28
	ldrsh r1, [r0, r2]
	movs r4, #0x2a
	ldrsh r2, [r0, r4]
	adds r1, #8
	adds r2, #0x10
	adds r0, r3, #0
	bl sub_08066580
	movs r0, #0x71
	bl sub_0803B4DC
	b _08066666
	.align 2, 0
_08066628: .4byte gUnknown_08580934
_0806662C: .4byte gUnknown_03002040
_08066630:
	ldr r0, [r5]
	adds r0, #0x70
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08066658
	ldrh r1, [r4, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08066658
	adds r0, r3, #0
	bl sub_080665BC
	movs r0, #0x66
	bl sub_0803B4DC
	b _08066666
_08066658:
	adds r4, #0x14
	adds r6, #4
	adds r3, #1
	ldr r0, [r5]
	ldrb r0, [r0, #8]
	cmp r3, r0
	blt _080665E8
_08066666:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

