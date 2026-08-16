	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080202A4
sub_080202A4: @ 0x080202A4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrb r4, [r6, #6]
	lsls r4, r4, #0x19
	lsrs r4, r4, #0x19
	ldr r5, _080202E0 @ =gUnknown_08499594
	ldr r1, [r5]
	subs r1, r6, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	ldrb r1, [r6]
	bl sub_08042D1C
	cmp r4, r0
	bge _080202E4
	ldrb r0, [r6, #6]
	lsls r0, r0, #0x19
	lsrs r3, r0, #0x19
	b _08020308
	.align 2, 0
_080202E0: .4byte gUnknown_08499594
_080202E4:
	ldr r1, [r5]
	subs r1, r6, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	ldrb r1, [r6]
	bl sub_08042D1C
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08020308:
	ldr r5, _08020328 @ =gUnknown_030013EC
	ldrb r0, [r6, #2]
	ldrb r1, [r6, #3]
	ldrb r2, [r6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r4, #1
	str r4, [sp]
	ldr r4, [r5]
	bl _call_via_r4
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020328: .4byte gUnknown_030013EC

