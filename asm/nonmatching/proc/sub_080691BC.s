	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080691BC
sub_080691BC: @ 0x080691BC
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	movs r0, #0xc6
	subs r0, r0, r1
	cmp r0, #0x5c
	beq _08069288
	cmp r0, #0x5c
	bgt _080691E8
	cmp r0, #0x1a
	beq _0806921A
	cmp r0, #0x1a
	bgt _080691DE
	cmp r0, #5
	beq _0806920A
	b _0806936C
_080691DE:
	cmp r0, #0x26
	beq _08069220
	cmp r0, #0x2a
	beq _08069244
	b _0806936C
_080691E8:
	cmp r0, #0xb9
	bne _080691EE
	b _08069308
_080691EE:
	cmp r0, #0xb9
	bgt _080691FC
	cmp r0, #0x60
	beq _080692A8
	cmp r0, #0x8c
	beq _080692CC
	b _0806936C
_080691FC:
	cmp r0, #0xba
	bne _08069202
	b _0806931C
_08069202:
	cmp r0, #0xbe
	bne _08069208
	b _08069344
_08069208:
	b _0806936C
_0806920A:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #1
	movs r2, #0x20
	adds r3, r4, #0
	bl sub_08067BD0
	b _0806936C
_0806921A:
	bl sub_08067A24
	b _0806936C
_08069220:
	ldr r0, _0806923C @ =gPal
	ldr r2, _08069240 @ =0x00007FFF
	adds r0, #2
	movs r1, #0xe
_08069228:
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08069228
	bl sub_080135A4
	bl sub_080677E8
	b _0806936C
	.align 2, 0
_0806923C: .4byte gPal
_08069240: .4byte 0x00007FFF
_08069244:
	ldr r0, _08069284 @ =gUnknown_0823BDE0
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #1
	movs r1, #1
	movs r2, #0xc
	adds r3, r4, #0
	bl sub_08067D04
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #8]
	movs r0, #0xc0
	str r0, [sp, #0xc]
	movs r0, #0xc
	str r0, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r0, #0
	movs r2, #0
	movs r3, #0x88
	bl sub_080679D8
	b _0806936C
	.align 2, 0
_08069284: .4byte gUnknown_0823BDE0
_08069288:
	ldr r0, _080692A0 @ =gPal
	ldr r2, _080692A4 @ =0x00007FFF
	adds r0, #2
	movs r1, #0xe
_08069290:
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08069290
	bl sub_080135A4
	b _0806936C
	.align 2, 0
_080692A0: .4byte gPal
_080692A4: .4byte 0x00007FFF
_080692A8:
	ldr r0, _080692C8 @ =gUnknown_0823BDE0
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0x28
	bl sub_08067C7C
	bl sub_0806780C
	bl sub_08067A24
	bl sub_08067D4C
	b _0806936C
	.align 2, 0
_080692C8: .4byte gUnknown_0823BDE0
_080692CC:
	ldr r2, _08069300 @ =gDispIo
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bl sub_08063994
	ldr r0, _08069304 @ =gUnknown_030030B4
	movs r1, #1
	bl sub_08012C48
	movs r0, #0x30
	movs r1, #1
	adds r2, r4, #0
	bl sub_080673D0
	b _0806936C
	.align 2, 0
_08069300: .4byte gDispIo
_08069304: .4byte gUnknown_030030B4
_08069308:
	ldr r0, _08069314 @ =gUnknown_0817DA38
	ldr r1, _08069318 @ =0x06008000
	bl Decompress
	b _0806936C
	.align 2, 0
_08069314: .4byte gUnknown_0817DA38
_08069318: .4byte 0x06008000
_0806931C:
	ldr r0, _08069338 @ =gUnknown_0817E208
	ldr r1, _0806933C @ =gUnknown_08499580
	ldr r1, [r1]
	bl Decompress
	ldr r0, _08069340 @ =gUnknown_0817DA18
	movs r1, #0x20
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_08013B0C
	b _0806936C
	.align 2, 0
_08069338: .4byte gUnknown_0817E208
_0806933C: .4byte gUnknown_08499580
_08069340: .4byte gUnknown_0817DA18
_08069344:
	bl sub_08012358
	ldr r2, _08069378 @ =gDispIo
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bl sub_08067820
_0806936C:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _0806937C
	subs r0, #1
	str r0, [r4, #0x2c]
	b _08069382
	.align 2, 0
_08069378: .4byte gDispIo
_0806937C:
	adds r0, r4, #0
	bl Proc_Break
_08069382:
	add sp, #0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

