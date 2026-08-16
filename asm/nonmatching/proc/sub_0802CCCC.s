	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CCCC
sub_0802CCCC: @ 0x0802CCCC
	push {lr}
	bl sub_0802C8F8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802CCF0
	bl sub_0802CBA0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802CCF0
	ldr r0, _0802CCF4 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0802CCF8
_0802CCF0:
	movs r0, #1
	b _0802CCFA
	.align 2, 0
_0802CCF4: .4byte gUnknown_030040D8
_0802CCF8:
	movs r0, #0
_0802CCFA:
	pop {r1}
	bx r1
	.align 2, 0

