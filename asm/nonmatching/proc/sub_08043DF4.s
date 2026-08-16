	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043DF4
sub_08043DF4: @ 0x08043DF4
	push {lr}
	bl sub_08044BA0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08043E0C
	ldr r0, _08043E08 @ =0x000001A3
	bl sub_0803B4EC
	b _08043E14
	.align 2, 0
_08043E08: .4byte 0x000001A3
_08043E0C:
	movs r0, #0xd2
	lsls r0, r0, #1
	bl sub_0803B4EC
_08043E14:
	pop {r0}
	bx r0

