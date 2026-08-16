	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804423C
sub_0804423C: @ 0x0804423C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804415C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08044272
	adds r0, r5, #0
	bl sub_080441D4
	cmp r0, #0
	bne _08044260
	adds r0, r5, #0
	bl sub_08044280
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08044278
_08044260:
	adds r0, r5, #0
	bl sub_08044094
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_080441D4
	cmp r4, r0
	bge _08044276
_08044272:
	movs r0, #0
	b _08044278
_08044276:
	movs r0, #1
_08044278:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

