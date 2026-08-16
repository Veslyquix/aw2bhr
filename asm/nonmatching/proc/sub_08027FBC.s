	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027FBC
sub_08027FBC: @ 0x08027FBC
	push {lr}
	adds r3, r2, #0
	lsls r1, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r1, r1, #0xc
	ldr r2, _08027FEC @ =0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	adds r0, r0, r1
	lsrs r3, r3, #0xc
	movs r1, #0xe5
	lsls r1, r1, #1
	adds r3, r3, r1
	ands r3, r2
	lsls r3, r3, #5
	ldr r1, _08027FF0 @ =0x06010000
	adds r3, r3, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r3, #0
	bl sub_08011E54
	pop {r0}
	bx r0
	.align 2, 0
_08027FEC: .4byte 0x000003FF
_08027FF0: .4byte 0x06010000

