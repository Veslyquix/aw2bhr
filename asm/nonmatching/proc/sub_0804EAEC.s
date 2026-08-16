	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804EAEC
sub_0804EAEC: @ 0x0804EAEC
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, _0804EB60 @ =gUnknown_03004580
	lsls r3, r0, #4
	adds r1, #2
	adds r3, r3, r1
	ldrh r6, [r3]
	lsls r2, r2, #0x18
	movs r1, #0xb4
	lsls r1, r1, #0x16
	adds r2, r2, r1
	lsrs r2, r2, #0x10
	lsls r1, r0, #8
	ldr r5, _0804EB64 @ =gUnknown_085D6A48
	lsls r3, r6, #1
	adds r3, r3, r6
	lsls r3, r3, #3
	adds r3, r3, r5
	ldrh r3, [r3, #0x12]
	muls r3, r4, r3
	adds r1, r1, r3
	adds r1, #0x28
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x10
	ldr r6, _0804EB68 @ =gUnknown_08551D1C
	ldr r5, _0804EB6C @ =gUnknown_02029A10
	lsls r3, r4, #3
	adds r3, r3, r4
	lsls r3, r3, #2
	movs r4, #0xb4
	muls r4, r0, r4
	adds r3, r3, r4
	adds r3, r3, r5
	ldrb r3, [r3]
	lsls r3, r3, #1
	adds r3, r3, r6
	ldrh r3, [r3]
	ldr r4, _0804EB70 @ =gUnknown_02029BA8
	lsls r3, r3, #2
	lsls r0, r0, #5
	adds r3, r3, r0
	adds r4, #0x18
	adds r3, r3, r4
	ldr r0, [r3]
	adds r0, r0, r2
	ldr r2, _0804EB74 @ =0x06010000
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_08011E54
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804EB60: .4byte gUnknown_03004580
_0804EB64: .4byte gUnknown_085D6A48
_0804EB68: .4byte gUnknown_08551D1C
_0804EB6C: .4byte gUnknown_02029A10
_0804EB70: .4byte gUnknown_02029BA8
_0804EB74: .4byte 0x06010000

