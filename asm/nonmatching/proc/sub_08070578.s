	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070578
sub_08070578: @ 0x08070578
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _080705A4 @ =gUnknown_08242308
	ldr r1, _080705A8 @ =gUnknown_0824238C
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _0807059E
	adds r0, r2, #0
	bl sub_080703B8
_0807059E:
	pop {r0}
	bx r0
	.align 2, 0
_080705A4: .4byte gUnknown_08242308
_080705A8: .4byte gUnknown_0824238C

