	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807B884
sub_0807B884: @ 0x0807B884
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0xcc
	lsls r4, r4, #1
	bl sub_0807898C
	ldr r0, _0807B8E8 @ =gUnknown_0822FEF0
	ldr r1, _0807B8EC @ =gUnknown_03001FE8
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	ldr r0, _0807B8F0 @ =gUnknown_0822F9AC
	ldr r1, _0807B8F4 @ =gUnknown_0849957C
	ldr r1, [r1]
	bl Decompress
	bl sub_08013AFC
	ldr r0, _0807B8F8 @ =gUnknown_0822FE50
	movs r1, #0x20
	movs r2, #0xa0
	bl ApplyPaletteExt
	ldr r0, _0807B8FC @ =gUnknown_086165B0
	adds r1, r5, #0
	bl Proc_Start
	ldr r2, _0807B900 @ =gUnknown_085C77A0
	ldr r0, _0807B904 @ =gUnknown_03003FC0
	ldrb r1, [r0, #2]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	adds r0, #0x58
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _0807B978
	lsls r0, r0, #2
	ldr r1, _0807B908 @ =_0807B90C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B8E8: .4byte gUnknown_0822FEF0
_0807B8EC: .4byte gUnknown_03001FE8
_0807B8F0: .4byte gUnknown_0822F9AC
_0807B8F4: .4byte gUnknown_0849957C
_0807B8F8: .4byte gUnknown_0822FE50
_0807B8FC: .4byte gUnknown_086165B0
_0807B900: .4byte gUnknown_085C77A0
_0807B904: .4byte gUnknown_03003FC0
_0807B908: .4byte _0807B90C
_0807B90C: @ jump table
	.4byte _0807B920 @ case 0
	.4byte _0807B92C @ case 1
	.4byte _0807B948 @ case 2
	.4byte _0807B93C @ case 3
	.4byte _0807B960 @ case 4
_0807B920:
	movs r4, #0xca
	lsls r4, r4, #1
	ldr r0, _0807B928 @ =gUnknown_0822DB88
	b _0807B94C
	.align 2, 0
_0807B928: .4byte gUnknown_0822DB88
_0807B92C:
	ldr r4, _0807B934 @ =0x00000197
	ldr r0, _0807B938 @ =gUnknown_0822DBA8
	b _0807B94C
	.align 2, 0
_0807B934: .4byte 0x00000197
_0807B938: .4byte gUnknown_0822DBA8
_0807B93C:
	movs r4, #0xcb
	lsls r4, r4, #1
	ldr r0, _0807B944 @ =gUnknown_0822DBC8
	b _0807B94C
	.align 2, 0
_0807B944: .4byte gUnknown_0822DBC8
_0807B948:
	ldr r4, _0807B958 @ =0x00000195
	ldr r0, _0807B95C @ =gUnknown_0822DBE8
_0807B94C:
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	b _0807B978
	.align 2, 0
_0807B958: .4byte 0x00000195
_0807B95C: .4byte gUnknown_0822DBE8
_0807B960:
	bl sub_08078E14
	movs r4, #0xcc
	lsls r4, r4, #1
	cmp r0, #0x22
	bne _0807B96E
	adds r4, #7
_0807B96E:
	ldr r0, _0807B98C @ =gUnknown_0822DB88
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
_0807B978:
	bl sub_08078E14
	subs r0, #8
	cmp r0, #0x22
	bhi _0807BA24
	lsls r0, r0, #2
	ldr r1, _0807B990 @ =_0807B994
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B98C: .4byte gUnknown_0822DB88
_0807B990: .4byte _0807B994
_0807B994: @ jump table
	.4byte _0807BA20 @ case 0
	.4byte _0807BA24 @ case 1
	.4byte _0807BA24 @ case 2
	.4byte _0807BA24 @ case 3
	.4byte _0807BA24 @ case 4
	.4byte _0807BA24 @ case 5
	.4byte _0807BA24 @ case 6
	.4byte _0807BA24 @ case 7
	.4byte _0807BA20 @ case 8
	.4byte _0807BA24 @ case 9
	.4byte _0807BA24 @ case 10
	.4byte _0807BA24 @ case 11
	.4byte _0807BA24 @ case 12
	.4byte _0807BA24 @ case 13
	.4byte _0807BA24 @ case 14
	.4byte _0807BA24 @ case 15
	.4byte _0807BA20 @ case 16
	.4byte _0807BA24 @ case 17
	.4byte _0807BA24 @ case 18
	.4byte _0807BA24 @ case 19
	.4byte _0807BA24 @ case 20
	.4byte _0807BA24 @ case 21
	.4byte _0807BA24 @ case 22
	.4byte _0807BA24 @ case 23
	.4byte _0807BA20 @ case 24
	.4byte _0807BA24 @ case 25
	.4byte _0807BA24 @ case 26
	.4byte _0807BA24 @ case 27
	.4byte _0807BA24 @ case 28
	.4byte _0807BA24 @ case 29
	.4byte _0807BA24 @ case 30
	.4byte _0807BA24 @ case 31
	.4byte _0807BA24 @ case 32
	.4byte _0807BA24 @ case 33
	.4byte _0807BA20 @ case 34
_0807BA20:
	movs r4, #0xcc
	lsls r4, r4, #1
_0807BA24:
	adds r0, r4, #0
	bl sub_0803B524
	ldr r0, _0807BA38 @ =gUnknown_08616508
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BA38: .4byte gUnknown_08616508

