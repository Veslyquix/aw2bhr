	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039338
sub_08039338: @ 0x08039338
	push {r4, r5, lr}
	ldr r5, _080393A4 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_080157D0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r3, _080393A8 @ =0xFFFFFF00
	adds r1, r0, r3
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r3
	cmp r0, #1
	bne _08039364
	movs r4, #0x80
	lsls r4, r4, #1
_08039364:
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r4, #0
	bl sub_080157A4
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r1, r4, #0
	bl sub_080157F4
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r4, r0
	bne _0803939C
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_080168BC
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #1
	bl sub_080156FC
	ldrb r0, [r5]
	bl sub_08015C30
_0803939C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080393A4: .4byte gUnknown_03001FBC
_080393A8: .4byte 0xFFFFFF00

