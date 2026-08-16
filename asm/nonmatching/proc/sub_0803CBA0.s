	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CBA0
sub_0803CBA0: @ 0x0803CBA0
	push {lr}
	adds r2, r0, #0
	subs r2, #0x60
	cmp r2, #0x3f
	bhi _0803CBB6
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r2, #0
	bl sub_0803C9D4
	b _0803CBD2
_0803CBB6:
	adds r2, r0, #0
	subs r2, #0x20
	cmp r2, #0x3f
	bhi _0803CBCA
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r2, #0
	bl sub_0803CA00
	b _0803CBD2
_0803CBCA:
	cmp r0, #0x1f
	bhi _0803CBD2
	bl sub_0803CB40
_0803CBD2:
	pop {r0}
	bx r0
	.align 2, 0

