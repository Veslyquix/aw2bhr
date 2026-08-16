	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080180CC
sub_080180CC: @ 0x080180CC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08018018
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	bne _080180F2
	ldr r0, _080180F8 @ =gUnknown_03002F08
	ldrb r0, [r0, #2]
	bl sub_0801815C
	ldr r0, _080180FC @ =sub_080180A8
	str r0, [r4, #8]
_080180F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080180F8: .4byte gUnknown_03002F08
_080180FC: .4byte sub_080180A8

