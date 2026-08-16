	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807FA88
sub_0807FA88: @ 0x0807FA88
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0807FACC @ =gUnknown_08610A38
	ldr r3, _0807FAD0 @ =gUnknown_085D3DD0
	ldr r0, _0807FAD4 @ =gUnknown_03005904
	ldr r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	ldr r0, _0807FAD8 @ =gUnknown_03005970
	ldr r1, [r0]
	lsls r0, r1, #6
	adds r0, r0, r1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, #0x38
	adds r0, r0, r3
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, _0807FADC @ =gUnknown_08616750
	adds r2, r4, #0
	bl sub_0807F8FC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r4, #0x58]
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FACC: .4byte gUnknown_08610A38
_0807FAD0: .4byte gUnknown_085D3DD0
_0807FAD4: .4byte gUnknown_03005904
_0807FAD8: .4byte gUnknown_03005970
_0807FADC: .4byte gUnknown_08616750

