	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030584
sub_08030584: @ 0x08030584
	push {r4, r5, lr}
	ldr r5, _080305E8 @ =gUnknown_08090CC8
	ldr r0, [r5]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r1, #0
	movs r4, #0
	strh r4, [r0, #4]
	ldrb r2, [r0, #1]
	strb r1, [r0, #1]
	bl sub_0802F23C
	ldr r1, _080305EC @ =gUnknown_030040C0
	movs r0, #0xa
	strh r0, [r1, #6]
	strh r4, [r1, #0xa]
	ldr r1, _080305F0 @ =gUnknown_0300410C
	ldr r0, _080305F4 @ =gUnknown_030040CC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _080305F8 @ =gUnknown_03003128
	ldr r3, _080305FC @ =gUnknown_03003F48
	movs r4, #3
_080305B2:
	ldrh r0, [r2]
	ldrh r1, [r3]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bge _080305B2
	ldr r2, [r5]
	ldr r1, [r2]
	ldrb r0, [r1, #1]
	movs r0, #2
	strb r0, [r1, #1]
	ldr r1, [r2]
	ldrh r0, [r1, #4]
	movs r0, #6
	strh r0, [r1, #4]
	bl sub_0803B588
	movs r0, #0xc8
	lsls r0, r0, #1
	bl sub_0803B524
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080305E8: .4byte gUnknown_08090CC8
_080305EC: .4byte gUnknown_030040C0
_080305F0: .4byte gUnknown_0300410C
_080305F4: .4byte gUnknown_030040CC
_080305F8: .4byte gUnknown_03003128
_080305FC: .4byte gUnknown_03003F48

