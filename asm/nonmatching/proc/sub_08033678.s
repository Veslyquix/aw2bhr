	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033678
sub_08033678: @ 0x08033678
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080336B8 @ =gUnknown_03004400
	adds r0, r5, #0
	movs r1, #0
	bl sub_080309AC
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080336B2
	ldrb r1, [r5]
	adds r0, r4, #0
	adds r0, #0x28
	strb r1, [r0]
	ldrb r0, [r5, #1]
	lsls r0, r0, #8
	ldrb r1, [r5, #2]
	orrs r0, r1
	strh r0, [r4, #0x2a]
	ldrb r0, [r5, #3]
	adds r2, r4, #0
	adds r2, #0x2e
	strb r0, [r2]
	adds r0, r4, #0
	bl Proc_Break
_080336B2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080336B8: .4byte gUnknown_03004400

