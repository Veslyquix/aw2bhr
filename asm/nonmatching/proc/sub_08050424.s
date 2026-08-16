	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08050424
sub_08050424: @ 0x08050424
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _08050490 @ =gUnknown_03004580
	lsls r4, r0, #4
	adds r3, #2
	adds r4, r4, r3
	ldrh r5, [r4]
	lsls r2, r2, #0x19
	lsrs r2, r2, #0x10
	lsls r4, r0, #8
	ldr r6, _08050494 @ =gUnknown_085D6A48
	lsls r3, r5, #1
	adds r3, r3, r5
	lsls r3, r3, #3
	adds r3, r3, r6
	ldrh r3, [r3, #0x12]
	muls r3, r1, r3
	adds r4, r4, r3
	lsls r4, r4, #0x15
	lsrs r4, r4, #0x10
	ldr r6, _08050498 @ =gUnknown_08551D1C
	ldr r5, _0805049C @ =gUnknown_02029A10
	lsls r3, r1, #3
	adds r3, r3, r1
	lsls r3, r3, #2
	movs r1, #0xb4
	muls r1, r0, r1
	adds r3, r3, r1
	adds r3, r3, r5
	ldrb r1, [r3]
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	ldr r3, _080504A0 @ =gUnknown_02029BA8
	lsls r1, r1, #2
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r3, #0x18
	adds r1, r1, r3
	ldr r0, [r1]
	adds r0, r0, r2
	ldr r1, _080504A4 @ =0x06010000
	adds r4, r4, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r4, #0
	bl sub_08011E54
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050490: .4byte gUnknown_03004580
_08050494: .4byte gUnknown_085D6A48
_08050498: .4byte gUnknown_08551D1C
_0805049C: .4byte gUnknown_02029A10
_080504A0: .4byte gUnknown_02029BA8
_080504A4: .4byte 0x06010000

