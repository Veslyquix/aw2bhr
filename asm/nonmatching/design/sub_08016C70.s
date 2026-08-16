	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016C70
sub_08016C70: @ 0x08016C70
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _08016C90
	bl sub_08016A14
	adds r0, r4, #0
	bl sub_0801ABF8
	ldr r0, _08016C98 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _08016C90
	bl sub_08016E74
_08016C90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08016C98: .4byte gUnknown_03003FC0

