	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B414
sub_0803B414: @ 0x0803B414
	push {r4, r5, lr}
	ldr r0, _0803B468 @ =gUnknown_03005B20
	ldr r5, _0803B46C @ =0x0000FFFF
	ldr r4, _0803B470 @ =gUnknown_030005CC
	ldrh r2, [r4]
	adds r1, r5, #0
	bl sub_08071420
	ldr r0, _0803B474 @ =gUnknown_03005C30
	ldrh r2, [r4]
	adds r1, r5, #0
	bl sub_08071420
	ldr r0, _0803B478 @ =gUnknown_03005BA0
	ldrh r2, [r4]
	adds r1, r5, #0
	bl sub_08071420
	ldr r0, _0803B47C @ =gUnknown_030059E0
	ldrh r2, [r4]
	adds r1, r5, #0
	bl sub_08071420
	ldr r0, _0803B480 @ =gUnknown_03005A60
	ldrh r2, [r4]
	adds r1, r5, #0
	bl sub_08071420
	ldr r0, _0803B484 @ =gUnknown_03005AA0
	ldrh r2, [r4]
	adds r1, r5, #0
	bl sub_08071420
	ldr r0, _0803B488 @ =gUnknown_03005BF0
	ldrh r2, [r4]
	adds r1, r5, #0
	bl sub_08071420
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803B468: .4byte gUnknown_03005B20
_0803B46C: .4byte 0x0000FFFF
_0803B470: .4byte gUnknown_030005CC
_0803B474: .4byte gUnknown_03005C30
_0803B478: .4byte gUnknown_03005BA0
_0803B47C: .4byte gUnknown_030059E0
_0803B480: .4byte gUnknown_03005A60
_0803B484: .4byte gUnknown_03005AA0
_0803B488: .4byte gUnknown_03005BF0

