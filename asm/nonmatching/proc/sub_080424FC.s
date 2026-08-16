	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080424FC
sub_080424FC: @ 0x080424FC
	push {r4, lr}
	bl sub_080424BC
	bl sub_080176A4
	ldr r4, _0804255C @ =gUnknown_030040D8
	ldr r1, [r4]
	ldr r2, _08042560 @ =gUnknown_03003100
	ldrh r0, [r2]
	strb r0, [r1, #2]
	ldr r1, [r4]
	ldrh r0, [r2, #2]
	strb r0, [r1, #3]
	ldr r0, _08042564 @ =gUnknown_03003FC0
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _08042528
	ldr r0, [r4]
	ldr r1, _08042568 @ =gUnknown_03004074
	ldrb r1, [r1]
	bl sub_08025B80
_08042528:
	bl sub_08035810
	ldr r2, [r4]
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r2, [r4]
	ldrb r1, [r2, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08042548
	movs r0, #2
	orrs r0, r1
	strb r0, [r2, #1]
_08042548:
	bl sub_080258CC
	ldr r0, [r4]
	bl sub_080743E8
	bl sub_080198D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804255C: .4byte gUnknown_030040D8
_08042560: .4byte gUnknown_03003100
_08042564: .4byte gUnknown_03003FC0
_08042568: .4byte gUnknown_03004074

