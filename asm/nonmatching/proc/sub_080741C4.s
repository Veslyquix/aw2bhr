	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080741C4
sub_080741C4: @ 0x080741C4
	push {lr}
	ldr r0, _080741F8 @ =gUnknown_0823A3D4
	ldr r1, _080741FC @ =gUnknown_0300251C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_08011CAC
	ldr r0, _08074200 @ =gUnknown_08239FA4
	ldr r1, _08074204 @ =gUnknown_08499584
	ldr r1, [r1]
	bl sub_08011CAC
	ldr r0, _08074208 @ =gUnknown_0823BDE0
	movs r1, #0
	movs r2, #0x20
	bl sub_08013618
	bl sub_08013B1C
	pop {r0}
	bx r0
	.align 2, 0
_080741F8: .4byte gUnknown_0823A3D4
_080741FC: .4byte gUnknown_0300251C
_08074200: .4byte gUnknown_08239FA4
_08074204: .4byte gUnknown_08499584
_08074208: .4byte gUnknown_0823BDE0

