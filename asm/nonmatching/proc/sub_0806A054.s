	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A054
sub_0806A054: @ 0x0806A054
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, _0806A12C @ =gUnknown_0202F204
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080674F4
	str r0, [r5, #0x2c]
	ldr r0, _0806A130 @ =gUnknown_085814A8
	bl sub_080670F8
	ldr r2, _0806A134 @ =gDispIo
	ldrb r1, [r2]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r4, #2
	orrs r0, r4
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r3, _0806A138 @ =gUnknown_03002B6C
	ldrb r1, [r3]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldr r3, _0806A13C @ =gUnknown_0300251C
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _0806A140 @ =gUnknown_030030B4
	ldrb r0, [r1]
	ands r2, r0
	orrs r2, r4
	strb r2, [r1]
	ldr r2, _0806A144 @ =gUnknown_03001FE8
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_08012358
	ldr r0, _0806A148 @ =gUnknown_0822FE50
	movs r1, #0x20
	movs r2, #0xa0
	bl ApplyPaletteExt
	ldr r0, _0806A14C @ =gUnknown_0822FEF0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl Decompress
	ldr r0, _0806A150 @ =gUnknown_0822F9AC
	ldr r1, _0806A154 @ =gUnknown_0849957C
	ldr r1, [r1]
	bl Decompress
	bl sub_08013AFC
	bl sub_08069FD0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #1
	movs r1, #2
	movs r2, #1
	adds r3, r5, #0
	bl sub_080677BC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A12C: .4byte gUnknown_0202F204
_0806A130: .4byte gUnknown_085814A8
_0806A134: .4byte gDispIo
_0806A138: .4byte gUnknown_03002B6C
_0806A13C: .4byte gUnknown_0300251C
_0806A140: .4byte gUnknown_030030B4
_0806A144: .4byte gUnknown_03001FE8
_0806A148: .4byte gUnknown_0822FE50
_0806A14C: .4byte gUnknown_0822FEF0
_0806A150: .4byte gUnknown_0822F9AC
_0806A154: .4byte gUnknown_0849957C

