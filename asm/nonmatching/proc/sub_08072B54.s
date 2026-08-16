	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072B54
sub_08072B54: @ 0x08072B54
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl sub_0803B4DC
	ldr r2, _08072B98 @ =gUnknown_08242308
	ldr r0, _08072B9C @ =gUnknown_0824238C
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r1, [r4, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl sub_08070668
	ldr r5, _08072BA0 @ =0x0000FFFF
	adds r0, r6, #0
	bl sub_08072B2C
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080714FC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072B98: .4byte gUnknown_08242308
_08072B9C: .4byte gUnknown_0824238C
_08072BA0: .4byte 0x0000FFFF

