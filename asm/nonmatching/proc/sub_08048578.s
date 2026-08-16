	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08048578
sub_08048578: @ 0x08048578
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x28]
	cmp r0, #0
	beq _0804859E
	ldr r2, _080485A4 @ =gUnknown_08499594
	ldr r0, _080485A8 @ =gUnknown_03003F2C
	ldrh r1, [r0]
	ldrh r0, [r3, #0x28]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	bl sub_08029088
_0804859E:
	pop {r0}
	bx r0
	.align 2, 0
_080485A4: .4byte gUnknown_08499594
_080485A8: .4byte gUnknown_03003F2C

