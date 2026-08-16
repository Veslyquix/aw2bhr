	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08086DD4
sub_08086DD4: @ 0x08086DD4
	push {lr}
	ldr r0, _08086DEC @ =gUnknown_03001FE8
	ldr r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	ldr r1, _08086DF0 @ =0x06004000
	adds r0, r0, r1
	bl sub_0801B6FC
	pop {r0}
	bx r0
	.align 2, 0
_08086DEC: .4byte gUnknown_03001FE8
_08086DF0: .4byte 0x06004000

