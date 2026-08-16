	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F27C
sub_0803F27C: @ 0x0803F27C
	cmp r0, #1
	beq _0803F290
	cmp r0, #1
	ble _0803F28C
	cmp r0, #2
	beq _0803F294
	cmp r0, #3
	beq _0803F298
_0803F28C:
	movs r0, #0
	b _0803F29A
_0803F290:
	movs r0, #1
	b _0803F29A
_0803F294:
	movs r0, #4
	b _0803F29A
_0803F298:
	movs r0, #5
_0803F29A:
	bx lr

