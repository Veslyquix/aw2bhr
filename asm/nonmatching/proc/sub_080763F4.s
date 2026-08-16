	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080763F4
sub_080763F4: @ 0x080763F4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08076468 @ =gUnknown_081D2284
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	ldr r4, _0807646C @ =gUnknown_086144DC
	ldr r0, [r5, #0x58]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08076470 @ =0x06012000
	bl sub_08011CAC
	ldr r0, _08076474 @ =gUnknown_081D33BC
	ldr r1, _08076478 @ =0x06012600
	bl sub_08011CAC
	ldr r0, [r5, #0x58]
	lsls r0, r0, #3
	adds r4, #4
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [r5, #0x60]
	ldr r2, _0807647C @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08076480 @ =gUnknown_03002020
	movs r3, #0
	strh r3, [r0]
	ldr r1, _08076484 @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _08076488 @ =gUnknown_03001FFC
	strh r3, [r0]
	ldrh r1, [r2]
	ldr r0, _0807648C @ =0x0000FFE0
	ands r0, r1
	ldr r1, _08076490 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf0
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldrb r0, [r2, #1]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076468: .4byte gUnknown_081D2284
_0807646C: .4byte gUnknown_086144DC
_08076470: .4byte 0x06012000
_08076474: .4byte gUnknown_081D33BC
_08076478: .4byte 0x06012600
_0807647C: .4byte gUnknown_030030E0
_08076480: .4byte gUnknown_03002020
_08076484: .4byte gUnknown_03002B28
_08076488: .4byte gUnknown_03001FFC
_0807648C: .4byte 0x0000FFE0
_08076490: .4byte 0x0000E0FF

