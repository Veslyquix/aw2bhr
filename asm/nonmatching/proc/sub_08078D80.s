	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078D80
sub_08078D80: @ 0x08078D80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08078DC0 @ =gUnknown_0822FEF0
	ldr r1, _08078DC4 @ =gUnknown_0300251C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_08011CAC
	ldr r0, _08078DC8 @ =gUnknown_0822F9AC
	ldr r1, _08078DCC @ =gUnknown_08499584
	ldr r1, [r1]
	bl sub_08011CAC
	bl sub_08013B1C
	ldr r0, _08078DD0 @ =gUnknown_082344CC
	movs r1, #0x20
	movs r2, #0xa0
	bl sub_08013618
	ldr r0, _08078DD4 @ =gUnknown_08615CA0
	adds r1, r4, #0
	bl Proc_Start
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078DC0: .4byte gUnknown_0822FEF0
_08078DC4: .4byte gUnknown_0300251C
_08078DC8: .4byte gUnknown_0822F9AC
_08078DCC: .4byte gUnknown_08499584
_08078DD0: .4byte gUnknown_082344CC
_08078DD4: .4byte gUnknown_08615CA0

