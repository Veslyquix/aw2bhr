	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807FA34
sub_0807FA34: @ 0x0807FA34
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807FA74 @ =gUnknown_03005970
	ldr r0, [r0]
	movs r1, #0xe5
	lsls r1, r1, #1
	movs r2, #4
	bl sub_08043BA4
	ldr r0, _0807FA78 @ =gUnknown_08239DE4
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0807FA7C @ =gUnknown_086167EC
	adds r1, r4, #0
	bl Proc_Start
	ldr r0, _0807FA80 @ =gUnknown_086167BC
	adds r1, r4, #0
	bl Proc_Start
	bl sub_08080EF8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FA74: .4byte gUnknown_03005970
_0807FA78: .4byte gUnknown_08239DE4
_0807FA7C: .4byte gUnknown_086167EC
_0807FA80: .4byte gUnknown_086167BC

