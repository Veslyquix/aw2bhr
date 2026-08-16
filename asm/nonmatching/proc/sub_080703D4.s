	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080703D4
sub_080703D4: @ 0x080703D4
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _080703F0 @ =0x68736D53
	cmp r3, r0
	bne _080703EC
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #0x28]
_080703EC:
	bx lr
	.align 2, 0
_080703F0: .4byte 0x68736D53

