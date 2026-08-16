	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08088004
sub_08088004: @ 0x08088004
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08088034 @ =gUnknown_03005908
	movs r0, #0
	str r0, [r1]
	bl sub_0808A5C4
	movs r0, #1
	bl sub_0801A5B0
	ldr r0, _08088038 @ =gUnknown_03005958
	ldrb r0, [r0]
	movs r1, #8
	bl sub_0802D5CC
	bl sub_0808A47C
	ldr r0, _0808803C @ =gUnknown_08616EB4
	adds r1, r4, #0
	bl Proc_Start
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088034: .4byte gUnknown_03005908
_08088038: .4byte gUnknown_03005958
_0808803C: .4byte gUnknown_08616EB4

