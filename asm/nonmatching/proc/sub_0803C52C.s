	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C52C
sub_0803C52C: @ 0x0803C52C
	push {r4, r5, lr}
	adds r5, r1, #0
	bl sub_0803CAB8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C540
	movs r0, #1
	rsbs r0, r0, #0
	b _0803C56E
_0803C540:
	movs r0, #0x21
	bl sub_0803CBD8
	cmp r0, #0
	beq _0803C56C
	ldr r4, _0803C564 @ =gUnknown_0200C420
	ldrh r0, [r4, #0x10]
	bl sub_08037DA4
	ldr r1, _0803C568 @ =gUnknown_030040D4
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	bl sub_08037DA4
	cmp r0, r5
	blt _0803C56C
	movs r0, #1
	b _0803C56E
	.align 2, 0
_0803C564: .4byte gUnknown_0200C420
_0803C568: .4byte gUnknown_030040D4
_0803C56C:
	movs r0, #0
_0803C56E:
	pop {r4, r5}
	pop {r1}
	bx r1

