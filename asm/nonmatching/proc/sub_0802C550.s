	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C550
sub_0802C550: @ 0x0802C550
	push {lr}
	ldr r0, _0802C56C @ =gUnknown_0849FEF8
	bl Proc_Find
	cmp r0, #0
	bne _0802C566
	ldr r0, _0802C570 @ =gUnknown_0849FFB0
	bl Proc_Find
	cmp r0, #0
	beq _0802C574
_0802C566:
	movs r0, #1
	b _0802C576
	.align 2, 0
_0802C56C: .4byte gUnknown_0849FEF8
_0802C570: .4byte gUnknown_0849FFB0
_0802C574:
	movs r0, #0
_0802C576:
	pop {r1}
	bx r1
	.align 2, 0

