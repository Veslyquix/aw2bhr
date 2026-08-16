	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043E18
sub_08043E18: @ 0x08043E18
	push {lr}
	bl sub_08044BA0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08043E30
	ldr r0, _08043E2C @ =0x00000199
	bl sub_0803B4EC
	b _08043E38
	.align 2, 0
_08043E2C: .4byte 0x00000199
_08043E30:
	movs r0, #0xcd
	lsls r0, r0, #1
	bl sub_0803B4EC
_08043E38:
	pop {r0}
	bx r0

