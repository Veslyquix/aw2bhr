	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041E48
sub_08041E48: @ 0x08041E48
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0802C57C
	bl sub_080424FC
	bl sub_0802C594
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08041E84
	ldr r0, _08041E8C @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08041E84
	ldr r0, _08041E90 @ =gUnknown_03003F38
	ldrb r1, [r0]
	ldr r2, [r4, #0x2c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, [r4, #0x30]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #5
	bl sub_08034534
_08041E84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041E8C: .4byte gUnknown_03003FC0
_08041E90: .4byte gUnknown_03003F38

