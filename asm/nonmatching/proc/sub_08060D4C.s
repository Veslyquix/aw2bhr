	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060D4C
sub_08060D4C: @ 0x08060D4C
	push {r4, lr}
	ldr r4, _08060D74 @ =gUnknown_030046C0
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _08060D6C
	bl sub_08060F00
	bl sub_08060F74
	bl sub_08060FFC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08060D6C
	strb r0, [r4, #6]
_08060D6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060D74: .4byte gUnknown_030046C0

