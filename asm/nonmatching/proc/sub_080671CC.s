	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080671CC
sub_080671CC: @ 0x080671CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080671EC @ =gUnknown_03001FFC
	ldr r0, [r4, #0x58]
	strh r0, [r1]
	cmp r0, #0
	bne _080671E0
	adds r0, r4, #0
	bl Proc_Break
_080671E0:
	ldr r0, [r4, #0x58]
	subs r0, #1
	str r0, [r4, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080671EC: .4byte gUnknown_03001FFC

