	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065EB4
sub_08065EB4: @ 0x08065EB4
	push {lr}
	ldr r0, _08065ED0 @ =gUnknown_08580934
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x32
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08065ED4
	bl sub_08065D20
	b _08065EEA
	.align 2, 0
_08065ED0: .4byte gUnknown_08580934
_08065ED4:
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r1, _08065EF0 @ =gpKeySt
	ldr r1, [r1]
	ldrh r1, [r1, #2]
	movs r2, #1
	bl sub_08065DAC
_08065EEA:
	pop {r0}
	bx r0
	.align 2, 0
_08065EF0: .4byte gpKeySt

