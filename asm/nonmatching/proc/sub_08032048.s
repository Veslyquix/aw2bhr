	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032048
sub_08032048: @ 0x08032048
	push {r4, r5, r6, lr}
	ldr r2, _08032080 @ =gUnknown_03003F1C
	ldr r1, _08032084 @ =gUnknown_030044C4
	movs r0, #0
	strb r0, [r1]
	ldrb r0, [r1]
	strb r0, [r2]
	ldr r6, _08032088 @ =gUnknown_0849B060
	ldr r5, [r6]
	movs r0, #3
	strh r0, [r5, #2]
	ldr r4, _0803208C @ =gUnknown_03003FC0
	ldrb r0, [r4, #2]
	subs r0, #0xb4
	movs r1, #3
	bl __modsi3
	strb r0, [r5, #8]
	ldr r5, [r6]
	ldrb r0, [r4, #2]
	subs r0, #0xb4
	movs r1, #3
	bl __divsi3
	strb r0, [r5, #9]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032080: .4byte gUnknown_03003F1C
_08032084: .4byte gUnknown_030044C4
_08032088: .4byte gUnknown_0849B060
_0803208C: .4byte gUnknown_03003FC0

