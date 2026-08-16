	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806050C
sub_0806050C: @ 0x0806050C
	push {r4, r5, lr}
	ldr r0, _08060544 @ =gUnknown_030040E4
	movs r1, #0
	ldrsh r5, [r0, r1]
	cmp r5, #0
	bne _0806053C
	ldr r4, _08060548 @ =gUnknown_030045E0
	ldr r0, [r4]
	cmp r0, #0
	beq _08060524
	bl sub_08035828
_08060524:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0806052E
	bl sub_08035828
_0806052E:
	bl sub_080424FC
	ldr r0, _0806054C @ =gUnknown_03004780
	movs r1, #2
	strh r1, [r0]
	ldr r0, _08060550 @ =gUnknown_030045D4
	strh r5, [r0]
_0806053C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060544: .4byte gUnknown_030040E4
_08060548: .4byte gUnknown_030045E0
_0806054C: .4byte gUnknown_03004780
_08060550: .4byte gUnknown_030045D4

