	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806384C
sub_0806384C: @ 0x0806384C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldrb r6, [r5]
	lsrs r2, r2, #0xf
	adds r2, r4, r2
	lsrs r3, r3, #0xa
	adds r2, r2, r3
	adds r5, #2
	movs r1, #0
	cmp r1, ip
	bhs _0806389E
_08063876:
	lsls r0, r1, #6
	adds r4, r2, r0
	movs r3, #0
	adds r1, #1
	cmp r3, r6
	bhs _08063896
_08063882:
	ldrh r0, [r5]
	adds r0, r7, r0
	strh r0, [r4]
	adds r5, #2
	adds r4, #2
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r6
	blo _08063882
_08063896:
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	cmp r1, ip
	blo _08063876
_0806389E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

