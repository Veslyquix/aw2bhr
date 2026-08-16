	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026520
sub_08026520: @ 0x08026520
	push {r4, r5, r6, lr}
	movs r5, #1
	ldr r6, _08026580 @ =gUnknown_08499598
_08026526:
	adds r0, r5, #0
	bl sub_080263A4
	ldr r1, [r6]
	lsls r4, r5, #4
	subs r4, r4, r5
	lsls r4, r4, #2
	adds r1, r4, r1
	adds r1, #0x34
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_08026424
	ldr r1, [r6]
	adds r1, r4, r1
	adds r1, #0x35
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_080264BC
	ldr r1, [r6]
	adds r1, r4, r1
	adds r1, #0x36
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_08026368
	ldr r1, [r6]
	adds r1, r4, r1
	strh r0, [r1, #0x38]
	ldrh r0, [r1, #0x38]
	bl sub_08037D80
	ldr r1, [r6]
	adds r4, r4, r1
	adds r4, #0x33
	strb r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _08026526
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08026580: .4byte gUnknown_08499598

