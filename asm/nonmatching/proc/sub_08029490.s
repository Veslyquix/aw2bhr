	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029490
sub_08029490: @ 0x08029490
	push {r4, lr}
	ldr r0, _080294E0 @ =gUnknown_08499590
	ldr r3, [r0]
	ldr r2, _080294E4 @ =gUnknown_030033E4
	ldrh r1, [r2, #2]
	lsls r1, r1, #1
	ldr r4, _080294E8 @ =0x0000417A
	adds r0, r3, r4
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r1, r0
	ldr r2, _080294EC @ =0x00002852
	adds r0, r3, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _080294F4
	ldr r4, _080294F0 @ =0x00001E42
	adds r0, r3, r4
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080294DA
	adds r0, r3, #0
	adds r0, #0x12
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _080294F4
	bl sub_08026F5C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080294F4
_080294DA:
	movs r0, #1
	b _080294F6
	.align 2, 0
_080294E0: .4byte gUnknown_08499590
_080294E4: .4byte gUnknown_030033E4
_080294E8: .4byte 0x0000417A
_080294EC: .4byte 0x00002852
_080294F0: .4byte 0x00001E42
_080294F4:
	movs r0, #0
_080294F6:
	pop {r4}
	pop {r1}
	bx r1

