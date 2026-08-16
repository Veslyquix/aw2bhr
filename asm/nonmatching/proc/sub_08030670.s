	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030670
sub_08030670: @ 0x08030670
	push {r4, r5, lr}
	ldr r4, _080306CC @ =gUnknown_08090CD0
	ldr r0, [r4]
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #4]
	ldrb r0, [r1, #1]
	strb r2, [r1, #1]
	bl sub_0802F03C
	bl sub_0803B5E8
	ldr r1, _080306D0 @ =gUnknown_030040C0
	movs r0, #0x26
	strh r0, [r1, #0xa]
	strh r0, [r1, #6]
	ldr r1, _080306D4 @ =gUnknown_0300410C
	ldr r0, _080306D8 @ =gUnknown_030040CC
	ldrh r0, [r0]
	strh r0, [r1]
	adds r5, r4, #0
	ldr r4, _080306DC @ =gUnknown_03003128
	ldr r3, _080306E0 @ =gUnknown_03003F48
	movs r2, #3
_080306A4:
	ldrh r0, [r4]
	ldrh r1, [r3]
	strh r0, [r3]
	adds r4, #2
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bge _080306A4
	ldr r2, [r5]
	ldr r1, [r2]
	ldrb r0, [r1, #1]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r1, [r2]
	ldrh r0, [r1, #4]
	movs r0, #6
	strh r0, [r1, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080306CC: .4byte gUnknown_08090CD0
_080306D0: .4byte gUnknown_030040C0
_080306D4: .4byte gUnknown_0300410C
_080306D8: .4byte gUnknown_030040CC
_080306DC: .4byte gUnknown_03003128
_080306E0: .4byte gUnknown_03003F48

