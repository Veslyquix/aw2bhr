	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BC08
sub_0801BC08: @ 0x0801BC08
	push {r4, lr}
	ldr r4, _0801BC34 @ =gUnknown_03000278
	ldrh r0, [r4, #0xa]
	cmp r0, #0
	beq _0801BC2C
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldrh r2, [r4, #0xa]
	lsls r2, r2, #1
	bl CpuFastSet
	ldr r0, [r4]
	ldrh r1, [r4, #0xa]
	bl sub_080718E8
	ldr r1, _0801BC38 @ =gUnknown_0300141C
	ldr r0, [r4]
	str r0, [r1]
_0801BC2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801BC34: .4byte gUnknown_03000278
_0801BC38: .4byte gUnknown_0300141C

