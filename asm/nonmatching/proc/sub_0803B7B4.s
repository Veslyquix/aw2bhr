	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B7B4
sub_0803B7B4: @ 0x0803B7B4
	push {lr}
	ldr r0, _0803B7CC @ =gUnknown_030005CA
	ldrh r1, [r0]
	ldr r0, _0803B7D0 @ =0x0000FFFF
	cmp r1, r0
	bne _0803B7C8
	ldr r0, _0803B7D4 @ =gUnknown_0849E7D8
	movs r1, #3
	bl Proc_Start
_0803B7C8:
	pop {r0}
	bx r0
	.align 2, 0
_0803B7CC: .4byte gUnknown_030005CA
_0803B7D0: .4byte 0x0000FFFF
_0803B7D4: .4byte gUnknown_0849E7D8

