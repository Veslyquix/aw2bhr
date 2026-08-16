	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801D8B4
sub_0801D8B4: @ 0x0801D8B4
	push {lr}
	ldr r0, _0801D8D8 @ =gUnknown_03003034
	movs r1, #0
	str r1, [r0]
	ldr r0, _0801D8DC @ =gUnknown_0200E438
	movs r2, #0
	movs r1, #0x1d
	ldr r3, _0801D8E0 @ =0x000008A4
	adds r0, r0, r3
_0801D8C6:
	str r2, [r0]
	subs r0, #0x4c
	subs r1, #1
	cmp r1, #0
	bge _0801D8C6
	bl sub_0801DA94
	pop {r0}
	bx r0
	.align 2, 0
_0801D8D8: .4byte gUnknown_03003034
_0801D8DC: .4byte gUnknown_0200E438
_0801D8E0: .4byte 0x000008A4

