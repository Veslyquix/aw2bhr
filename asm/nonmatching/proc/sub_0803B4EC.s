	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B4EC
sub_0803B4EC: @ 0x0803B4EC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0803B504 @ =gUnknown_03003FC0
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	beq _0803B508
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	bl sub_0803B524
	b _0803B514
	.align 2, 0
_0803B504: .4byte gUnknown_03003FC0
_0803B508:
	ldr r0, _0803B518 @ =gUnknown_030005C8
	strh r1, [r0]
	ldr r1, _0803B51C @ =gUnknown_030005CA
	ldr r2, _0803B520 @ =0x0000FFFF
	adds r0, r2, #0
	strh r0, [r1]
_0803B514:
	pop {r0}
	bx r0
	.align 2, 0
_0803B518: .4byte gUnknown_030005C8
_0803B51C: .4byte gUnknown_030005CA
_0803B520: .4byte 0x0000FFFF

