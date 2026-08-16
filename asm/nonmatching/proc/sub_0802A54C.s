	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A54C
sub_0802A54C: @ 0x0802A54C
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0802A56C
	ldrb r1, [r4, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0802A56C
	ldr r0, _0802A574 @ =gUnknown_0849A198
	adds r1, r2, #0
	bl Proc_Start
	str r4, [r0, #0x4c]
_0802A56C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A574: .4byte gUnknown_0849A198

