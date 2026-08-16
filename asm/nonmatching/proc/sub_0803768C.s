	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803768C
sub_0803768C: @ 0x0803768C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	mov r8, r1
	adds r6, r2, #0
	adds r4, r3, #0
	ldr r0, _080376D0 @ =gUnknown_0300057C
	str r4, [r0]
	ldr r0, _080376D4 @ =gUnknown_081253F0
	lsls r1, r4, #0x15
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _080376D8 @ =0x000003FF
	ands r0, r6
	lsls r0, r0, #5
	adds r5, r5, r0
	adds r0, r5, #0
	bl sub_080377C4
	lsls r4, r4, #0xc
	orrs r4, r6
	mov r0, r8
	adds r1, r4, #0
	bl sub_08037A20
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080376D0: .4byte gUnknown_0300057C
_080376D4: .4byte gUnknown_081253F0
_080376D8: .4byte 0x000003FF

