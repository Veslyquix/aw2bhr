	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D944
sub_0806D944: @ 0x0806D944
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _0806DBE8 @ =sub_08036884
	bl sub_080366D0
	ldr r0, _0806DBEC @ =sub_080368E8
	bl sub_080366C4
	ldr r0, _0806DBF0 @ =gUnknown_0849D16C
	bl sub_08012C58
	bl sub_0801237C
	ldr r2, _0806DBF4 @ =gUnknown_030030E0
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
	ldr r1, _0806DBF8 @ =gUnknown_03002020
	movs r0, #0xf
	strh r0, [r1]
	ldr r1, _0806DBFC @ =gUnknown_03002B28
	movs r0, #6
	strh r0, [r1]
	bl sub_08013C00
	bl sub_08013C54
	bl sub_08013CA8
	bl sub_08013AEC
	bl sub_08013AFC
	bl sub_08013B0C
	bl sub_08013B1C
	ldr r0, _0806DC00 @ =gUnknown_03001FF8
	movs r4, #0
	strh r4, [r0]
	ldr r0, _0806DC04 @ =gUnknown_03001418
	strh r4, [r0]
	ldr r0, _0806DC08 @ =gUnknown_03002B34
	strh r4, [r0]
	ldr r0, _0806DC0C @ =gUnknown_03002F18
	strh r4, [r0]
	ldr r0, _0806DC10 @ =gUnknown_030030A0
	strh r4, [r0]
	ldr r0, _0806DC14 @ =gUnknown_03001400
	strh r4, [r0]
	ldr r0, _0806DC18 @ =gUnknown_0300200C
	strh r4, [r0]
	ldr r0, _0806DC1C @ =gUnknown_03002000
	strh r4, [r0]
	ldr r0, _0806DC20 @ =gUnknown_0822FEF0
	ldr r1, _0806DC24 @ =gUnknown_0300251C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_08011CAC
	ldr r0, _0806DC28 @ =gUnknown_0822F9AC
	ldr r1, _0806DC2C @ =gUnknown_08499584
	ldr r1, [r1]
	bl sub_08011CAC
	ldr r0, _0806DC30 @ =gUnknown_082344CC
	movs r1, #0x20
	movs r2, #0xa0
	bl sub_08013618
	bl sub_08013B1C
	ldr r0, _0806DC34 @ =gUnknown_030030B4
	ldr r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	ldr r1, _0806DC38 @ =0x06006C00
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
	bl sub_0806D850
	bl sub_0801F114
	ldr r5, _0806DC3C @ =0x06010000
	movs r2, #0xa4
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
	movs r2, #0xa8
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
	movs r0, #0x8c
	bl sub_0801F234
	movs r0, #0x8d
	bl sub_0801F234
	movs r2, #0xb8
	lsls r2, r2, #2
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
	bl sub_0806D820
	ldr r0, _0806DC40 @ =gUnknown_08580CC4
	movs r1, #3
	bl sub_080152EC
	bl sub_080733B8
	ldr r0, _0806DC44 @ =gUnknown_085802AC
	ldr r1, _0806DC48 @ =gUnknown_0200FC50
	movs r2, #0x8c
	lsls r2, r2, #2
	movs r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r3, #3
	str r3, [sp, #8]
	movs r3, #0xf
	bl sub_08073304
	bl sub_0806D620
	bl sub_0806D268
	ldr r0, _0806DC4C @ =gUnknown_08580934
	ldr r0, [r0]
	adds r0, #0x30
	strb r4, [r0]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806DBE8: .4byte sub_08036884
_0806DBEC: .4byte sub_080368E8
_0806DBF0: .4byte gUnknown_0849D16C
_0806DBF4: .4byte gUnknown_030030E0
_0806DBF8: .4byte gUnknown_03002020
_0806DBFC: .4byte gUnknown_03002B28
_0806DC00: .4byte gUnknown_03001FF8
_0806DC04: .4byte gUnknown_03001418
_0806DC08: .4byte gUnknown_03002B34
_0806DC0C: .4byte gUnknown_03002F18
_0806DC10: .4byte gUnknown_030030A0
_0806DC14: .4byte gUnknown_03001400
_0806DC18: .4byte gUnknown_0300200C
_0806DC1C: .4byte gUnknown_03002000
_0806DC20: .4byte gUnknown_0822FEF0
_0806DC24: .4byte gUnknown_0300251C
_0806DC28: .4byte gUnknown_0822F9AC
_0806DC2C: .4byte gUnknown_08499584
_0806DC30: .4byte gUnknown_082344CC
_0806DC34: .4byte gUnknown_030030B4
_0806DC38: .4byte 0x06006C00
_0806DC3C: .4byte 0x06010000
_0806DC40: .4byte gUnknown_08580CC4
_0806DC44: .4byte gUnknown_085802AC
_0806DC48: .4byte gUnknown_0200FC50
_0806DC4C: .4byte gUnknown_08580934

