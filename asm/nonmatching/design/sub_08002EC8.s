	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08002EC8
sub_08002EC8: @ 0x08002EC8
	push {lr}
	bl sub_08001DAC
	ldr r0, _08002EEC @ =gUnknown_0200B0B0
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08002EF4
	movs r0, #7
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _08002EF0
	bl sub_08002AB0
	b _08002EF4
	.align 2, 0
_08002EEC: .4byte gUnknown_0200B0B0
_08002EF0:
	bl sub_08002C38
_08002EF4:
	pop {r0}
	bx r0

