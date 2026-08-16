	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027A08
sub_08027A08: @ 0x08027A08
	push {r4, lr}
	ldr r4, _08027A3C @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_080157D0
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	lsrs r0, r0, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	bgt _08027A40
	movs r2, #0
	ldrsh r0, [r4, r2]
	movs r1, #1
	bl sub_080157A4
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_08015328
	b _08027A48
	.align 2, 0
_08027A3C: .4byte gUnknown_03001FBC
_08027A40:
	movs r2, #0
	ldrsh r0, [r4, r2]
	bl sub_080157A4
_08027A48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

