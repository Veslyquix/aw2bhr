	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080335CC
sub_080335CC: @ 0x080335CC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x20]
	cmp r1, #0
	beq _080335DA
	bl _call_via_r1
_080335DA:
	ldr r0, _08033630 @ =gUnknown_030044D8
	ldrb r0, [r0]
	adds r5, r0, #0
	cmp r5, #0
	bne _08033628
	ldrh r1, [r4, #0x2c]
	ldr r6, _08033634 @ =gUnknown_0849B018
	ldr r0, [r6]
	ldrh r0, [r0, #0x22]
	subs r0, #1
	cmp r1, r0
	beq _0803360E
	ldr r0, [r4, #0x24]
	adds r0, #0x80
	str r0, [r4, #0x24]
	movs r0, #0x64
	muls r0, r1, r0
	ldrh r1, [r4, #0x2a]
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
_0803360E:
	ldr r0, [r4, #0x24]
	bl sub_08030930
	ldr r0, [r6]
	ldrb r1, [r0, #0x1d]
	strb r5, [r0, #0x1d]
	ldrh r0, [r4, #0x2c]
	ldrh r1, [r4, #0x2a]
	cmp r0, r1
	blo _08033628
	adds r0, r4, #0
	bl Proc_Break
_08033628:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033630: .4byte gUnknown_030044D8
_08033634: .4byte gUnknown_0849B018

