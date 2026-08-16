	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08022A08
sub_08022A08: @ 0x08022A08
	push {lr}
	bl sub_08013C00
	bl sub_08013AEC
	bl sub_080227A8
	bl sub_08024584
	ldr r0, _08022A2C @ =gUnknown_03000559
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08022A30 @ =gUnknown_08499B4C
	bl sub_0801537C
	pop {r0}
	bx r0
	.align 2, 0
_08022A2C: .4byte gUnknown_03000559
_08022A30: .4byte gUnknown_08499B4C

