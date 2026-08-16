	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080677E8
sub_080677E8: @ 0x080677E8
	push {lr}
	ldr r0, _08067808 @ =gUnknown_08580FE4
	bl Proc_Find
	movs r1, #0
	str r1, [r0, #0x30]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x5c]
	ldr r0, [r0, #0x58]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r2, #0
	bl sub_08072C40
	pop {r0}
	bx r0
	.align 2, 0
_08067808: .4byte gUnknown_08580FE4

