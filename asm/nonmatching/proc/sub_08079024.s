	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08079024
sub_08079024: @ 0x08079024
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_0807A908
	ldr r4, _080790C4 @ =gUnknown_08499598
	ldr r2, [r4]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x34
	ldrb r0, [r1]
	str r0, [r5, #0x58]
	bl sub_0807A908
	ldr r2, [r4]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x35
	ldrb r0, [r1]
	str r0, [r5, #0x5c]
	bl sub_0807A908
	ldr r2, [r4]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x36
	ldrb r0, [r1]
	str r0, [r5, #0x60]
	adds r0, r5, #0
	adds r0, #0x4c
	movs r6, #0
	strh r6, [r0]
	adds r0, #0x18
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	ldr r1, [r5, #0x58]
	ldr r0, [r5, #0x5c]
	adds r1, r1, r0
	ldr r0, [r5, #0x60]
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x6a
	strh r0, [r1]
	str r6, [r5, #0x2c]
	str r6, [r5, #0x30]
	bl sub_0807A908
	ldr r2, [r4]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x33
	ldrb r1, [r1]
	adds r2, r5, #0
	adds r2, #0x52
	movs r0, #5
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _080790B6
	movs r0, #3
	strh r0, [r2]
_080790B6:
	ldrh r0, [r2]
	cmp r0, #3
	bne _080790C8
	movs r0, #0x10
	str r0, [r5, #0x40]
	b _080790CA
	.align 2, 0
_080790C4: .4byte gUnknown_08499598
_080790C8:
	str r6, [r5, #0x40]
_080790CA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

