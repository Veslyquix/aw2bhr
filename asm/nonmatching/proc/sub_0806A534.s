	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A534
sub_0806A534: @ 0x0806A534
	push {lr}
	ldr r0, _0806A564 @ =gUnknown_0300060C
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, _0806A568 @ =0x00000206
	adds r0, r0, r2
	ldr r1, _0806A56C @ =0x000001FF
	ands r0, r1
	ldr r1, _0806A570 @ =gUnknown_0202F210
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r2, #0x82
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0806A574 @ =gUnknown_085815C8
	movs r3, #0x80
	lsls r3, r3, #5
	bl sub_0801BD00
	pop {r0}
	bx r0
	.align 2, 0
_0806A564: .4byte gUnknown_0300060C
_0806A568: .4byte 0x00000206
_0806A56C: .4byte 0x000001FF
_0806A570: .4byte gUnknown_0202F210
_0806A574: .4byte gUnknown_085815C8

