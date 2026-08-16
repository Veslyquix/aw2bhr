	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017A80
sub_08017A80: @ 0x08017A80
	push {r4, r5, lr}
	ldr r2, _08017AB0 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r5, r2, #4
	adds r5, r4, r5
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r4, r4, r2
	adds r0, r4, #0
	bl _call_via_r1
	ldr r0, [r5]
	adds r0, #0x10
	str r0, [r5]
	ldr r0, [r4]
	cmp r0, #0
	bne _08017AB4
	movs r0, #0
	b _08017AB6
	.align 2, 0
_08017AB0: .4byte gUnknown_0200C528
_08017AB4:
	movs r0, #1
_08017AB6:
	pop {r4, r5}
	pop {r1}
	bx r1

