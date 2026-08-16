	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018AA8
sub_08018AA8: @ 0x08018AA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08018AD4 @ =gUnknown_030032D8
	ldrh r0, [r0]
	cmp r0, #0xc
	bne _08018ACC
	ldrb r0, [r4, #0x11]
	bl sub_0804415C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08018ACC
	ldr r0, _08018AD8 @ =gUnknown_030033EC
	ldrh r0, [r0]
	cmp r0, #1
	bne _08018ACC
	movs r0, #0
	str r0, [r4, #8]
_08018ACC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018AD4: .4byte gUnknown_030032D8
_08018AD8: .4byte gUnknown_030033EC

