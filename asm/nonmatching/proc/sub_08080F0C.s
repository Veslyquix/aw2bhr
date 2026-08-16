	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080F0C
sub_08080F0C: @ 0x08080F0C
	push {lr}
	ldr r0, _08080F28 @ =gUnknown_03005970
	ldr r0, [r0]
	bl sub_08044BA0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08080F2C
	movs r0, #0xe4
	lsls r0, r0, #1
	bl sub_0803B524
	b _08080F32
	.align 2, 0
_08080F28: .4byte gUnknown_03005970
_08080F2C:
	ldr r0, _08080F38 @ =0x000001C5
	bl sub_0803B524
_08080F32:
	pop {r0}
	bx r0
	.align 2, 0
_08080F38: .4byte 0x000001C5

