	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802EA24
sub_0802EA24: @ 0x0802EA24
	push {lr}
	ldr r1, _0802EA4C @ =0x04000004
	movs r0, #8
	strh r0, [r1]
	ldr r1, _0802EA50 @ =0x04000208
	movs r0, #1
	strh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0802EA54 @ =sub_0802E920
	bl sub_080366D0
	ldr r0, _0802EA58 @ =sub_0802E960
	bl sub_080366C4
	pop {r0}
	bx r0
	.align 2, 0
_0802EA4C: .4byte 0x04000004
_0802EA50: .4byte 0x04000208
_0802EA54: .4byte sub_0802E920
_0802EA58: .4byte sub_0802E960

