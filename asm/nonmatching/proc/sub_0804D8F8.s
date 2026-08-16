	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804D8F8
sub_0804D8F8: @ 0x0804D8F8
	push {lr}
	ldr r3, _0804D920 @ =gUnknown_03001470
	ldr r0, _0804D924 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r2, [r0, r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #5
	adds r0, r3, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldrh r0, [r0]
	adds r3, #0x34
	adds r1, r1, r3
	ldrh r1, [r1]
	bl sub_0804DC5C
	pop {r0}
	bx r0
	.align 2, 0
_0804D920: .4byte gUnknown_03001470
_0804D924: .4byte gUnknown_03001FBC

