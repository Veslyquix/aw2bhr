	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804256C
sub_0804256C: @ 0x0804256C
	push {r4, r5, lr}
	bl sub_080424BC
	bl sub_080176A4
	ldr r4, _080425B0 @ =gUnknown_030040D8
	ldr r1, [r4]
	ldr r2, _080425B4 @ =gUnknown_03003100
	ldrh r0, [r2]
	strb r0, [r1, #2]
	ldr r1, [r4]
	ldrh r0, [r2, #2]
	strb r0, [r1, #3]
	bl sub_08035810
	ldr r2, [r4]
	ldrb r0, [r2, #1]
	movs r1, #1
	movs r5, #0
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r4, [r4]
	ldrb r1, [r4, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080425A8
	movs r0, #2
	orrs r0, r1
	strb r0, [r4, #1]
_080425A8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080425B0: .4byte gUnknown_030040D8
_080425B4: .4byte gUnknown_03003100

