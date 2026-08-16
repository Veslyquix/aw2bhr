	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065990
sub_08065990: @ 0x08065990
	push {r4, r5, r6, lr}
	ldr r0, _08065C2C @ =sub_08036884
	bl sub_080366D0
	ldr r0, _08065C30 @ =sub_080368E8
	bl sub_080366C4
	ldr r0, _08065C34 @ =gUnknown_0849D16C
	bl sub_08012C58
	bl sub_0801237C
	ldr r2, _08065C38 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r1, _08065C3C @ =gUnknown_03002020
	movs r0, #0xf
	strh r0, [r1]
	ldr r1, _08065C40 @ =gUnknown_03002B28
	movs r0, #6
	strh r0, [r1]
	bl sub_08013C00
	bl sub_08013C54
	bl sub_08013CA8
	bl sub_08013AEC
	bl sub_08013AFC
	bl sub_08013B0C
	bl sub_08013B1C
	ldr r0, _08065C44 @ =gUnknown_03001FF8
	movs r4, #0
	strh r4, [r0]
	ldr r0, _08065C48 @ =gUnknown_03001418
	strh r4, [r0]
	ldr r0, _08065C4C @ =gUnknown_03002B34
	strh r4, [r0]
	ldr r0, _08065C50 @ =gUnknown_03002F18
	strh r4, [r0]
	ldr r0, _08065C54 @ =gUnknown_030030A0
	strh r4, [r0]
	ldr r0, _08065C58 @ =gUnknown_03001400
	strh r4, [r0]
	ldr r0, _08065C5C @ =gUnknown_0300200C
	strh r4, [r0]
	ldr r0, _08065C60 @ =gUnknown_03002000
	strh r4, [r0]
	ldr r0, _08065C64 @ =gUnknown_0822FEF0
	ldr r1, _08065C68 @ =gUnknown_0300251C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	ldr r0, _08065C6C @ =gUnknown_0822F9AC
	ldr r1, _08065C70 @ =gUnknown_08499584
	ldr r1, [r1]
	bl Decompress
	ldr r0, _08065C74 @ =gUnknown_082344CC
	movs r1, #0x20
	movs r2, #0xa0
	bl ApplyPaletteExt
	bl sub_08013B1C
	ldr r0, _08065C78 @ =gUnknown_030030B4
	ldr r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	ldr r1, _08065C7C @ =0x06006C00
	adds r0, r0, r1
	movs r1, #0
	movs r2, #8
	bl sub_0802D5A0
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x1e
	movs r3, #4
	bl sub_0801A444
	movs r0, #0
	movs r1, #3
	bl sub_0802D5CC
	bl sub_0801F49C
	ldr r1, _08065C80 @ =0x06015200
	bl Decompress
	bl sub_0806574C
	ldr r0, _08065C84 @ =gUnknown_08580CB4
	movs r1, #3
	bl sub_080152EC
	bl sub_0801F114
	ldr r5, _08065C88 @ =0x06010000
	movs r2, #0xa6
	lsls r2, r2, #2
	movs r0, #1
	adds r1, r5, #0
	movs r3, #0x19
	bl sub_0801F150
	movs r0, #0x3e
	bl sub_0801F234
	movs r0, #0x3f
	bl sub_0801F234
	movs r0, #0x40
	bl sub_0801F234
	movs r0, #0x41
	bl sub_0801F234
	movs r2, #0xaa
	lsls r2, r2, #2
	movs r0, #2
	adds r1, r5, #0
	movs r3, #0x1a
	bl sub_0801F150
	movs r0, #0x4a
	bl sub_0801F234
	movs r0, #0x4b
	bl sub_0801F234
	movs r0, #0x4c
	bl sub_0801F234
	movs r0, #0x4d
	bl sub_0801F234
	movs r0, #0x4e
	bl sub_0801F234
	movs r0, #0x43
	bl sub_0801F234
	movs r0, #0x44
	bl sub_0801F234
	movs r0, #0x55
	bl sub_0801F234
	movs r0, #0x56
	bl sub_0801F234
	movs r0, #0x57
	bl sub_0801F234
	movs r0, #0x58
	bl sub_0801F234
	movs r0, #0x59
	bl sub_0801F234
	movs r0, #0x5a
	bl sub_0801F234
	movs r0, #0x5b
	bl sub_0801F234
	movs r0, #0x5c
	bl sub_0801F234
	movs r0, #0x5d
	bl sub_0801F234
	movs r0, #0x5e
	bl sub_0801F234
	movs r0, #0x68
	bl sub_0801F234
	ldr r2, _08065C8C @ =0x000002D2
	movs r0, #5
	adds r1, r5, #0
	movs r3, #0x1b
	bl sub_0801F150
	movs r0, #0xbc
	bl sub_0801F234
	movs r0, #0xbd
	bl sub_0801F234
	movs r0, #0xbe
	bl sub_0801F234
	movs r0, #0xbf
	bl sub_0801F234
	movs r0, #0xc0
	bl sub_0801F234
	movs r0, #0xc1
	bl sub_0801F234
	movs r0, #0xc2
	bl sub_0801F234
	movs r0, #0xc3
	bl sub_0801F234
	movs r0, #0xc4
	bl sub_0801F234
	movs r0, #0xc5
	bl sub_0801F234
	movs r0, #0xc6
	bl sub_0801F234
	movs r0, #0xc7
	bl sub_0801F234
	movs r0, #0xc8
	bl sub_0801F234
	movs r0, #0xc9
	bl sub_0801F234
	movs r0, #0xca
	bl sub_0801F234
	movs r0, #0xcb
	bl sub_0801F234
	movs r0, #0xcc
	bl sub_0801F234
	movs r0, #0xcd
	bl sub_0801F234
	movs r0, #0xce
	bl sub_0801F234
	movs r0, #0xcf
	bl sub_0801F234
	movs r0, #0xd0
	bl sub_0801F234
	movs r0, #0xd1
	bl sub_0801F234
	movs r0, #0xd2
	bl sub_0801F234
	movs r0, #0xd3
	bl sub_0801F234
	movs r0, #0xd4
	bl sub_0801F234
	movs r0, #0xd5
	bl sub_0801F234
	movs r0, #0xd6
	bl sub_0801F234
	movs r0, #0xd7
	bl sub_0801F234
	ldr r0, _08065C90 @ =gUnknown_08580CC4
	movs r1, #3
	bl sub_080152EC
	ldr r5, _08065C94 @ =gUnknown_08580934
	ldr r0, [r5]
	adds r0, #0x30
	movs r6, #0
	strb r4, [r0]
	ldr r4, _08065C98 @ =gpKeySt
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #4]
	bl sub_08065238
	ldr r0, [r5]
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r4]
	strh r6, [r0, #4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08065C2C: .4byte sub_08036884
_08065C30: .4byte sub_080368E8
_08065C34: .4byte gUnknown_0849D16C
_08065C38: .4byte gUnknown_030030E0
_08065C3C: .4byte gUnknown_03002020
_08065C40: .4byte gUnknown_03002B28
_08065C44: .4byte gUnknown_03001FF8
_08065C48: .4byte gUnknown_03001418
_08065C4C: .4byte gUnknown_03002B34
_08065C50: .4byte gUnknown_03002F18
_08065C54: .4byte gUnknown_030030A0
_08065C58: .4byte gUnknown_03001400
_08065C5C: .4byte gUnknown_0300200C
_08065C60: .4byte gUnknown_03002000
_08065C64: .4byte gUnknown_0822FEF0
_08065C68: .4byte gUnknown_0300251C
_08065C6C: .4byte gUnknown_0822F9AC
_08065C70: .4byte gUnknown_08499584
_08065C74: .4byte gUnknown_082344CC
_08065C78: .4byte gUnknown_030030B4
_08065C7C: .4byte 0x06006C00
_08065C80: .4byte 0x06015200
_08065C84: .4byte gUnknown_08580CB4
_08065C88: .4byte 0x06010000
_08065C8C: .4byte 0x000002D2
_08065C90: .4byte gUnknown_08580CC4
_08065C94: .4byte gUnknown_08580934
_08065C98: .4byte gpKeySt

