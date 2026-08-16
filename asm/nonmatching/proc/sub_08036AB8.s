	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08036AB8
sub_08036AB8: @ 0x08036AB8
	push {r4, r5, lr}
	ldr r5, _08036B18 @ =gUnknown_03004094
	ldrb r0, [r5]
	cmp r0, #0
	bne _08036B10
	ldr r2, _08036B1C @ =gUnknown_03004008
	ldr r0, _08036B20 @ =gUnknown_030043F4
	ldrh r1, [r0]
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _08036B10
	bl sub_08013510
	bl sub_08054B7C
	bl sub_08019470
	ldr r4, _08036B24 @ =gProcTreeRootArray
	ldr r0, [r4, #4]
	bl Proc_Run
	ldr r0, [r4, #8]
	bl Proc_Run
	ldr r0, [r4, #0xc]
	bl Proc_Run
	bl sub_08015954
	ldr r0, [r4, #0x14]
	bl Proc_Run
	ldr r0, [r4, #0x10]
	bl Proc_Run
	bl sub_0801F06C
	bl sub_0801F084
	bl sub_0803B404
	movs r0, #1
	strb r0, [r5]
_08036B10:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08036B18: .4byte gUnknown_03004094
_08036B1C: .4byte gUnknown_03004008
_08036B20: .4byte gUnknown_030043F4
_08036B24: .4byte gProcTreeRootArray

