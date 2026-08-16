	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019E50
sub_08019E50: @ 0x08019E50
	push {lr}
	ldr r0, _08019E64 @ =gUnknown_030033E8
	ldrb r1, [r0]
	ldrb r0, [r0, #1]
	cmn r1, r0
	bne _08019E60
	bl sub_0801A168
_08019E60:
	pop {r0}
	bx r0
	.align 2, 0
_08019E64: .4byte gUnknown_030033E8

