	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080743B8
sub_080743B8: @ 0x080743B8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080743DA
	ldr r1, _080743E0 @ =gUnknown_03002F08
	movs r0, #8
	strb r0, [r1]
	ldr r0, _080743E4 @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_0801A57C
	adds r0, r4, #0
	bl Proc_Break
_080743DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080743E0: .4byte gUnknown_03002F08
_080743E4: .4byte gUnknown_030033EC

