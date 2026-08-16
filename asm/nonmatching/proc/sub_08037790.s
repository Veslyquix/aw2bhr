	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037790
sub_08037790: @ 0x08037790
	push {lr}
	ldr r0, _080377B8 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x3c
	ands r0, r1
	lsrs r0, r0, #1
	ldr r1, _080377BC @ =gUnknown_08125410
	adds r0, r0, r1
	ldr r1, _080377C0 @ =gUnknown_0300057C
	ldr r1, [r1]
	lsls r1, r1, #5
	adds r1, #0x1c
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #2
	bl sub_0801368C
	pop {r0}
	bx r0
	.align 2, 0
_080377B8: .4byte gUnknown_03004008
_080377BC: .4byte gUnknown_08125410
_080377C0: .4byte gUnknown_0300057C

