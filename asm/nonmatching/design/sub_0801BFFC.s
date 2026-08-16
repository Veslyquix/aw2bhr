	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BFFC
sub_0801BFFC: @ 0x0801BFFC
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	cmp r0, #0
	bne _0801C00C
	ldr r0, _0801C018 @ =gUnknown_0848B418
	bl Proc_Find
_0801C00C:
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801C018: .4byte gUnknown_0848B418

