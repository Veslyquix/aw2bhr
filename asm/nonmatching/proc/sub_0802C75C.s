	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C75C
sub_0802C75C: @ 0x0802C75C
	push {lr}
	bl sub_0802C62C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0802C784
	bl sub_0802C660
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C784
	ldr r0, _0802C780 @ =gUnknown_03003FC0
	ldrb r0, [r0, #9]
	cmp r0, #3
	bne _0802C784
	movs r0, #0
	b _0802C786
	.align 2, 0
_0802C780: .4byte gUnknown_03003FC0
_0802C784:
	movs r0, #1
_0802C786:
	pop {r1}
	bx r1
	.align 2, 0

