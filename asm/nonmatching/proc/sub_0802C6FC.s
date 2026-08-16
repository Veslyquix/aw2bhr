	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C6FC
sub_0802C6FC: @ 0x0802C6FC
	push {lr}
	bl sub_0802C62C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0802C724
	bl sub_0802C660
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C724
	ldr r0, _0802C720 @ =gUnknown_03003FC0
	ldrb r0, [r0, #9]
	cmp r0, #1
	bne _0802C724
	movs r0, #0
	b _0802C726
	.align 2, 0
_0802C720: .4byte gUnknown_03003FC0
_0802C724:
	movs r0, #1
_0802C726:
	pop {r1}
	bx r1
	.align 2, 0

