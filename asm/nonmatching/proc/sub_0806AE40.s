	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806AE40
sub_0806AE40: @ 0x0806AE40
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0806AE78 @ =gUnknown_0858178C
	ldr r1, [r5, #0x2c]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [r5, #0x34]
	bl sub_08011CAC
	ldr r1, [r5, #0x2c]
	cmp r1, #7
	bne _0806AE7C
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	adds r4, r5, #0
	adds r4, #0x38
	ldrb r1, [r4]
	lsls r1, r1, #5
	movs r2, #0xe0
	bl sub_08013618
	b _0806AE98
	.align 2, 0
_0806AE78: .4byte gUnknown_0858178C
_0806AE7C:
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x10
	adds r0, r0, r1
	ldr r0, [r0]
	adds r4, r5, #0
	adds r4, #0x38
	ldrb r1, [r4]
	lsls r1, r1, #5
	movs r2, #0xc0
	bl sub_08013618
_0806AE98:
	adds r3, r5, #0
	adds r3, #0x39
	adds r2, r4, #0
	ldr r4, [r5, #0x34]
	movs r1, #0xa0
	lsls r1, r1, #2
_0806AEA4:
	ldrb r0, [r2]
	lsls r0, r0, #0xc
	ldrh r5, [r4]
	adds r0, r0, r5
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _0806AEA4
	ldrb r0, [r3]
	bl sub_08013AD4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

