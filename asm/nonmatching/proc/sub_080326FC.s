	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080326FC
sub_080326FC: @ 0x080326FC
	push {r4, lr}
	ldr r4, _08032718 @ =gUnknown_0849B060
	ldr r2, [r4]
	ldrb r1, [r2, #9]
	ldr r0, _0803271C @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08032720
	ldrh r0, [r2]
	movs r1, #6
	b _08032724
	.align 2, 0
_08032718: .4byte gUnknown_0849B060
_0803271C: .4byte gUnknown_0849B018
_08032720:
	ldrh r0, [r2]
	movs r1, #7
_08032724:
	movs r2, #2
	bl sub_080315E8
	ldr r1, [r4]
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

