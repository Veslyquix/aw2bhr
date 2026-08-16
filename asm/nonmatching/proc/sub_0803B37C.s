	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B37C
sub_0803B37C: @ 0x0803B37C
	push {r4, lr}
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	bl sub_0803B350
	adds r0, r4, #0
	bl sub_0803B35C
	bl sub_080703F4
	ldr r0, _0803B3A4 @ =gUnknown_030005C8
	ldr r2, _0803B3A8 @ =0x0000FFFF
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0803B3AC @ =gUnknown_030005CA
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803B3A4: .4byte gUnknown_030005C8
_0803B3A8: .4byte 0x0000FFFF
_0803B3AC: .4byte gUnknown_030005CA

