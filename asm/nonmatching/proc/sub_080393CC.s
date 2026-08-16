	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080393CC
sub_080393CC: @ 0x080393CC
	push {r4, r5, lr}
	ldr r5, _08039418 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #0
	bl sub_080156FC
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_080157D0
	adds r4, r0, #0
	lsls r4, r4, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r4, r4, r1
	asrs r4, r4, #0x10
	adds r1, r4, #0
	bl sub_080157A4
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r1, r4, #0
	bl sub_080157F4
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r4, r0
	bne _08039410
	ldrb r0, [r5]
	bl sub_08015C30
_08039410:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08039418: .4byte gUnknown_03001FBC

