	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080392C8
sub_080392C8: @ 0x080392C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	subs r0, #8
	str r0, [r4, #0x2c]
	cmp r0, #0xaf
	bgt _080392E8
	movs r0, #0xb0
	str r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080392E8:
	adds r0, r4, #0
	bl sub_0803927C
	pop {r4}
	pop {r0}
	bx r0

