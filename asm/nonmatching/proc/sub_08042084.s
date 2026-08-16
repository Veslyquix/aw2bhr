	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042084
sub_08042084: @ 0x08042084
	ldr r1, _08042094 @ =gUnknown_084995C1
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08042098
	movs r0, #0
	b _0804209A
	.align 2, 0
_08042094: .4byte gUnknown_084995C1
_08042098:
	movs r0, #1
_0804209A:
	bx lr

