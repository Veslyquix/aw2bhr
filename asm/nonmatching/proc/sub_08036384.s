	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08036384
sub_08036384: @ 0x08036384
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0
	beq _080363C0
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080363AC
	ldrh r0, [r4, #0x3e]
	cmp r0, #0
	bne _080363AC
	adds r0, r4, #0
	bl sub_080360D0
	ldr r0, [r4]
	cmp r0, #0
	beq _080363C6
_080363AC:
	ldr r0, _080363CC @ =gUnknown_0849BE20
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r4, #0
	bl _call_via_r1
_080363C0:
	adds r0, r4, #0
	bl sub_080359A4
_080363C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080363CC: .4byte gUnknown_0849BE20

