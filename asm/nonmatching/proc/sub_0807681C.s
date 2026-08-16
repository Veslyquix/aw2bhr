	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807681C
sub_0807681C: @ 0x0807681C
	push {r4, r5, lr}
	movs r5, #0
	ldr r0, _08076854 @ =gUnknown_0202FDFC
	adds r4, r0, #0
	adds r4, #0x12
_08076826:
	ldrb r1, [r4]
	cmp r1, #0
	beq _08076844
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08076844
	movs r0, #0x7f
	ands r1, r0
	movs r0, #0xfe
	ands r1, r0
	strb r1, [r4]
	adds r0, r5, #0
	bl sub_08075904
_08076844:
	adds r4, #1
	adds r5, #1
	cmp r5, #0x29
	ble _08076826
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076854: .4byte gUnknown_0202FDFC

