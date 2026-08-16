	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CC90
sub_0802CC90: @ 0x0802CC90
	push {lr}
	ldr r0, _0802CCC0 @ =gUnknown_030040D8
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0x18
	bne _0802CCC4
	ldrb r1, [r1, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0802CCC4
	bl sub_0802C8F8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802CCC4
	bl sub_0802CBA0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802CCC4
	movs r0, #0
	b _0802CCC6
	.align 2, 0
_0802CCC0: .4byte gUnknown_030040D8
_0802CCC4:
	movs r0, #1
_0802CCC6:
	pop {r1}
	bx r1
	.align 2, 0

