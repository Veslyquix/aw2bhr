	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804A048
sub_0804A048: @ 0x0804A048
	push {lr}
	bl sub_0801237C
	ldr r0, _0804A094 @ =gUnknown_0849D16C
	bl sub_08012C58
	bl sub_0801295C
	bl sub_080128D0
	ldr r2, _0804A098 @ =gDispIo
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	bl sub_08013C00
	bl sub_08013C54
	bl sub_08013CA8
	bl sub_080616F0
	bl sub_08013AEC
	bl sub_08013AFC
	bl sub_08013B0C
	bl sub_08013B1C
	ldr r0, _0804A09C @ =gUnknown_084C3814
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0804A094: .4byte gUnknown_0849D16C
_0804A098: .4byte gDispIo
_0804A09C: .4byte gUnknown_084C3814

