	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035B3C
sub_08035B3C: @ 0x08035B3C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08035B64 @ =gUnknown_0849CD88
	adds r0, #0x37
	ldrb r0, [r0]
	adds r0, #1
	bl sub_08042DE0
	subs r0, #1
	adds r4, #0x36
	ldrb r2, [r4]
	lsls r1, r2, #3
	adds r1, r1, r2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r0, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08035B64: .4byte gUnknown_0849CD88

