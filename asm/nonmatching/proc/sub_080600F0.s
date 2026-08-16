	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080600F0
sub_080600F0: @ 0x080600F0
	push {lr}
	ldr r2, _08060108 @ =gUnknown_030046C0
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	ldrb r2, [r2, #1]
	bl sub_08025E08
	ldr r1, _0806010C @ =gUnknown_030045D4
	movs r0, #0xb
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08060108: .4byte gUnknown_030046C0
_0806010C: .4byte gUnknown_030045D4

