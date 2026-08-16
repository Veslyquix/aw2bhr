	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080713F8
sub_080713F8: @ 0x080713F8
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _0807141C @ =0x68736D53
	cmp r3, r0
	bne _08071414
	strh r1, [r2, #0x1e]
	ldrh r4, [r2, #0x1c]
	adds r0, r1, #0
	muls r0, r4, r0
	asrs r0, r0, #8
	strh r0, [r2, #0x20]
_08071414:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807141C: .4byte 0x68736D53

