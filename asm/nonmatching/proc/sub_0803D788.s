	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D788
sub_0803D788: @ 0x0803D788
	push {r4, r5, lr}
	bl sub_0801237C
	ldr r2, _0803D844 @ =gUnknown_030030E0
	ldrb r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0803D848 @ =gUnknown_03001FFC
	movs r0, #0x1f
	strh r0, [r1]
	bl sub_08011B18
	ldr r0, _0803D84C @ =sub_080368E8
	bl sub_080366C4
	ldr r0, _0803D850 @ =sub_08036884
	bl sub_080366D0
	ldr r0, _0803D854 @ =gUnknown_0849D16C
	bl sub_08012C58
	bl sub_0801295C
	ldr r0, _0803D858 @ =gUnknown_0823A3D4
	ldr r1, _0803D85C @ =gUnknown_0300251C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_08011CAC
	ldr r0, _0803D860 @ =gUnknown_08239FA4
	ldr r5, _0803D864 @ =gUnknown_08499584
	ldr r1, [r5]
	bl sub_08011CAC
	ldr r0, [r5]
	movs r4, #0x80
	lsls r4, r4, #4
	movs r1, #0
	adds r2, r4, #0
	bl sub_080130C8
	ldr r0, _0803D868 @ =gUnknown_0823BDE0
	movs r1, #0
	movs r2, #0x20
	bl sub_08013618
	bl sub_08013B1C
	ldr r0, _0803D86C @ =gUnknown_08499578
	ldr r0, [r0]
	ldr r1, _0803D870 @ =0x06007000
	adds r2, r4, #0
	bl sub_08011C68
	ldr r0, _0803D874 @ =gUnknown_0849957C
	ldr r0, [r0]
	ldr r1, _0803D878 @ =0x0600F000
	adds r2, r4, #0
	bl sub_08011C68
	ldr r0, _0803D87C @ =gUnknown_08499580
	ldr r0, [r0]
	ldr r1, _0803D880 @ =0x06007800
	adds r2, r4, #0
	bl sub_08011C68
	ldr r0, [r5]
	ldr r1, _0803D884 @ =0x0600F800
	adds r2, r4, #0
	bl sub_08011C68
	bl sub_08022A34
	movs r0, #0
	bl sub_0801B780
	movs r0, #0
	bl sub_0801A5B0
	ldr r0, _0803D888 @ =gUnknown_0809165C
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_08013618
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803D844: .4byte gUnknown_030030E0
_0803D848: .4byte gUnknown_03001FFC
_0803D84C: .4byte sub_080368E8
_0803D850: .4byte sub_08036884
_0803D854: .4byte gUnknown_0849D16C
_0803D858: .4byte gUnknown_0823A3D4
_0803D85C: .4byte gUnknown_0300251C
_0803D860: .4byte gUnknown_08239FA4
_0803D864: .4byte gUnknown_08499584
_0803D868: .4byte gUnknown_0823BDE0
_0803D86C: .4byte gUnknown_08499578
_0803D870: .4byte 0x06007000
_0803D874: .4byte gUnknown_0849957C
_0803D878: .4byte 0x0600F000
_0803D87C: .4byte gUnknown_08499580
_0803D880: .4byte 0x06007800
_0803D884: .4byte 0x0600F800
_0803D888: .4byte gUnknown_0809165C

