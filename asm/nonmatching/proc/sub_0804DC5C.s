	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804DC5C
sub_0804DC5C: @ 0x0804DC5C
	push {r4, r5, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _0804DCA0 @ =gUnknown_084C3F78
	lsls r2, r0, #2
	adds r2, r2, r3
	ldr r2, [r2]
	ldrh r5, [r2]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, _0804DCA4 @ =gUnknown_02029A10
	lsls r2, r1, #3
	adds r2, r2, r1
	lsls r2, r2, #2
	movs r1, #0xb4
	muls r0, r1, r0
	adds r2, r2, r0
	adds r2, r2, r3
	movs r0, #8
	ldrsh r1, [r2, r0]
	ldrh r2, [r2, #0xa]
	subs r2, r2, r5
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_080155C0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804DCA0: .4byte gUnknown_084C3F78
_0804DCA4: .4byte gUnknown_02029A10

