	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803941C
sub_0803941C: @ 0x0803941C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _080394A0 @ =gUnknown_0849D73C
	ldr r2, _080394A4 @ =gUnknown_0849D730
	movs r1, #0
	str r1, [sp]
	movs r3, #0
	bl sub_08015438
	adds r4, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	add r0, sp, #4
	adds r1, r4, #0
	bl sub_08015638
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	ldr r0, _080394A8 @ =0xFFFF0FFF
	ands r0, r2
	movs r3, #0xc0
	lsls r3, r3, #6
	orrs r0, r3
	lsls r5, r5, #3
	ldr r3, _080394AC @ =0x0000030A
	adds r5, r5, r3
	adds r3, #0xf5
	ands r5, r3
	ldr r3, _080394B0 @ =0xFFFFFC00
	ands r0, r3
	adds r2, r0, #0
	orrs r2, r5
	adds r0, r4, #0
	bl sub_08015608
	adds r6, #0x14
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x50
	bl sub_080155C0
	adds r0, r4, #0
	bl sub_08016824
	adds r0, r4, #0
	bl sub_08016944
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080157A4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080157F4
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080394A0: .4byte gUnknown_0849D73C
_080394A4: .4byte gUnknown_0849D730
_080394A8: .4byte 0xFFFF0FFF
_080394AC: .4byte 0x0000030A
_080394B0: .4byte 0xFFFFFC00

