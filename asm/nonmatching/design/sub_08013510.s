	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013510
sub_08013510: @ 0x08013510
	push {r4, lr}
	ldr r0, _08013538 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801353C
	bl sub_080303B0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0801353C
	bl sub_080303C8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl sub_08030234
	b _08013548
	.align 2, 0
_08013538: .4byte gUnknown_03003FC0
_0801353C:
	ldr r0, _08013558 @ =0x04000130
	ldrh r1, [r0]
	ldr r2, _0801355C @ =0x000003FF
	adds r0, r2, #0
	adds r4, r0, #0
	bics r4, r1
_08013548:
	ldr r0, _08013560 @ =gUnknown_03002090
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	bl sub_0801348C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013558: .4byte 0x04000130
_0801355C: .4byte 0x000003FF
_08013560: .4byte gUnknown_03002090

