	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806366C
sub_0806366C: @ 0x0806366C
	push {lr}
	ldr r2, _08063688 @ =0x000003FF
	ands r2, r1
	cmp r0, #0
	bge _08063684
	lsls r0, r2, #5
	ldr r1, _0806368C @ =0x06010000
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_08011D7C
_08063684:
	pop {r0}
	bx r0
	.align 2, 0
_08063688: .4byte 0x000003FF
_0806368C: .4byte 0x06010000

