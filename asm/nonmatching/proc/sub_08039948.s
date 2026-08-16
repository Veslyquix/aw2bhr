	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039948
sub_08039948: @ 0x08039948
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x54]
	ldr r1, _0803997C @ =gUnknown_080A36A8
	lsls r0, r4, #5
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_08013AEC
	ldr r1, _08039980 @ =gUnknown_085D3DD0
	lsls r0, r4, #6
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x14]
	cmp r1, #1
	beq _08039996
	cmp r1, #1
	bgt _08039984
	cmp r1, #0
	beq _0803998E
	b _080399D2
	.align 2, 0
_0803997C: .4byte gUnknown_080A36A8
_08039980: .4byte gUnknown_085D3DD0
_08039984:
	cmp r1, #2
	beq _080399AC
	cmp r1, #3
	beq _080399C0
	b _080399D2
_0803998E:
	movs r0, #0x18
	str r0, [r5, #0x2c]
	str r1, [r5, #0x30]
	b _080399A0
_08039996:
	movs r0, #0x18
	rsbs r0, r0, #0
	str r0, [r5, #0x2c]
	movs r0, #0
	str r0, [r5, #0x30]
_080399A0:
	movs r0, #0xac
	lsls r0, r0, #2
	movs r1, #8
	bl sub_080399F8
	b _080399D2
_080399AC:
	movs r0, #0
	str r0, [r5, #0x2c]
	movs r0, #0x18
	str r0, [r5, #0x30]
	movs r0, #0xac
	lsls r0, r0, #2
	movs r1, #8
	bl sub_08039A58
	b _080399D2
_080399C0:
	movs r0, #0
	str r0, [r5, #0x2c]
	subs r0, #0x18
	str r0, [r5, #0x30]
	movs r0, #0xac
	lsls r0, r0, #2
	movs r1, #8
	bl sub_08039A58
_080399D2:
	pop {r4, r5}
	pop {r0}
	bx r0

