	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803FD80
sub_0803FD80: @ 0x0803FD80
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	ldr r1, _0803FDCC @ =gUnknown_085C77A0
	ldr r0, _0803FDD0 @ =gUnknown_03003FC0
	ldrb r2, [r0, #2]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r1, #0x10
	adds r0, r0, r1
	ldr r6, [r0]
	ldr r0, _0803FDD4 @ =gUnknown_080D24E0
	adds r1, r7, #0
	adds r1, #0x7c
	ldr r4, _0803FDD8 @ =0x000003FF
	ands r1, r4
	lsls r1, r1, #5
	ldr r5, _0803FDDC @ =0x06010000
	adds r1, r1, r5
	bl sub_08011CAC
	movs r0, #5
	bl sub_0803E354
	cmp r0, #0
	beq _0803FDF4
	bl sub_0803866C
	cmp r0, #0
	beq _0803FDE4
	ldr r0, _0803FDE0 @ =gUnknown_080D2AE8
	adds r1, r7, #0
	adds r1, #0xa0
	ands r1, r4
	lsls r1, r1, #5
	adds r1, r1, r5
	bl sub_08011CAC
	b _0803FDF4
	.align 2, 0
_0803FDCC: .4byte gUnknown_085C77A0
_0803FDD0: .4byte gUnknown_03003FC0
_0803FDD4: .4byte gUnknown_080D24E0
_0803FDD8: .4byte 0x000003FF
_0803FDDC: .4byte 0x06010000
_0803FDE0: .4byte gUnknown_080D2AE8
_0803FDE4:
	ldr r0, _0803FE38 @ =gUnknown_080D2AE8
	adds r1, r7, #0
	adds r1, #0xc4
	ands r1, r4
	lsls r1, r1, #5
	adds r1, r1, r5
	bl sub_08011CAC
_0803FDF4:
	movs r0, #7
	bl sub_0803E354
	cmp r0, #0
	beq _0803FE00
	ldr r6, _0803FE3C @ =gUnknown_080D22C4
_0803FE00:
	movs r0, #2
	bl sub_0803E354
	cmp r0, #0
	beq _0803FE18
	ldr r6, _0803FE40 @ =gUnknown_080D3268
	ldr r0, _0803FE44 @ =gUnknown_080D3FC4
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
_0803FE18:
	cmp r6, #0
	beq _0803FE30
	adds r1, r7, #0
	adds r1, #0xe8
	ldr r0, _0803FE48 @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _0803FE4C @ =0x06010000
	adds r1, r1, r0
	adds r0, r6, #0
	bl sub_08011CAC
_0803FE30:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FE38: .4byte gUnknown_080D2AE8
_0803FE3C: .4byte gUnknown_080D22C4
_0803FE40: .4byte gUnknown_080D3268
_0803FE44: .4byte gUnknown_080D3FC4
_0803FE48: .4byte 0x000003FF
_0803FE4C: .4byte 0x06010000

