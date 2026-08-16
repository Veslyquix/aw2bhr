	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CC04
sub_0802CC04: @ 0x0802CC04
	push {lr}
	bl sub_0802CBA0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802CC2A
	ldr r0, _0802CC30 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldr r2, _0802CC34 @ =gUnknown_03003100
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r3, #2
	ldrsh r2, [r2, r3]
	bl sub_0804223C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0802CC38
_0802CC2A:
	movs r0, #1
	b _0802CC3A
	.align 2, 0
_0802CC30: .4byte gUnknown_030040D8
_0802CC34: .4byte gUnknown_03003100
_0802CC38:
	movs r0, #0
_0802CC3A:
	pop {r1}
	bx r1
	.align 2, 0

