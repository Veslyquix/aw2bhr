	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804C578
sub_0804C578: @ 0x0804C578
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0804C598 @ =gUnknown_0300453C
	strh r0, [r1]
	ldr r3, _0804C59C @ =gUnknown_0300451C
	ldr r2, _0804C5A0 @ =gUnknown_08552148
	lsls r1, r0, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	strh r1, [r3]
	bl sub_0804C400
	pop {r0}
	bx r0
	.align 2, 0
_0804C598: .4byte gUnknown_0300453C
_0804C59C: .4byte gUnknown_0300451C
_0804C5A0: .4byte gUnknown_08552148

