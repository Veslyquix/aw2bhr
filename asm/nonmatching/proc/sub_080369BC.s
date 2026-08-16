	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080369BC
sub_080369BC: @ 0x080369BC
	push {r4, r5, lr}
	ldr r0, _08036A3C @ =gUnknown_08090EE8
	ldr r1, [r0]
	ldrb r1, [r1]
	adds r5, r0, #0
	cmp r1, #0
	bne _08036A36
	ldr r2, _08036A40 @ =gUnknown_03004008
	ldr r0, _08036A44 @ =gUnknown_030043F4
	ldrh r1, [r0]
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _08036A36
	bl sub_0801F050
	bl sub_08013510
	bl sub_08054B7C
	bl sub_08019470
	ldr r0, _08036A48 @ =gUnknown_03003F3C
	ldr r0, [r0]
	cmp r0, #0
	beq _080369F8
	cmp r0, #1
	bne _080369F8
	bl sub_080345C8
_080369F8:
	bl sub_08015954
	ldr r4, _08036A4C @ =gProcTreeRootArray
	ldr r0, [r4, #4]
	bl Proc_Run
	ldr r0, [r4, #8]
	bl Proc_Run
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	ldr r0, [r4, #0x10]
	bl Proc_Run
	bl sub_08023EEC
	bl sub_0803F990
	bl sub_0801F06C
	bl sub_0801F084
	bl sub_0803B404
	ldr r1, [r5]
	movs r0, #1
	strb r0, [r1]
_08036A36:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08036A3C: .4byte gUnknown_08090EE8
_08036A40: .4byte gUnknown_03004008
_08036A44: .4byte gUnknown_030043F4
_08036A48: .4byte gUnknown_03003F3C
_08036A4C: .4byte gProcTreeRootArray

