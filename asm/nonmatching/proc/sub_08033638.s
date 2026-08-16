	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033638
sub_08033638: @ 0x08033638
	push {lr}
	ldr r0, _08033670 @ =gUnknown_0849B018
	ldr r0, [r0]
	ldr r2, _08033674 @ =gUnknown_030044D8
	movs r1, #0
	strb r1, [r2]
	ldrh r1, [r0, #0x20]
	movs r2, #0
	strh r2, [r0, #0x20]
	ldrh r1, [r0, #0x20]
	ldrh r3, [r0, #0x22]
	strh r1, [r0, #0x22]
	ldrh r1, [r0, #0x2a]
	strh r2, [r0, #0x2a]
	ldrh r1, [r0, #0x2a]
	ldrh r2, [r0, #0x28]
	strh r1, [r0, #0x28]
	ldrh r1, [r0, #0x28]
	ldrh r2, [r0, #0x26]
	strh r1, [r0, #0x26]
	ldrh r1, [r0, #0x26]
	ldrh r2, [r0, #0x24]
	strh r1, [r0, #0x24]
	bl sub_0802F03C
	pop {r0}
	bx r0
	.align 2, 0
_08033670: .4byte gUnknown_0849B018
_08033674: .4byte gUnknown_030044D8

