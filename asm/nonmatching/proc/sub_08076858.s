	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076858
sub_08076858: @ 0x08076858
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _08076884 @ =gUnknown_0202FE0E
_0807685E:
	adds r0, r4, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _08076876
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08076876
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl sub_08074754
_08076876:
	adds r4, #1
	cmp r4, #0x29
	ble _0807685E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076884: .4byte gUnknown_0202FE0E

