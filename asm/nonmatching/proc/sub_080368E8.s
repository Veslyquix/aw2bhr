	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080368E8
sub_080368E8: @ 0x080368E8
	push {r4, r5, lr}
	ldr r5, _0803693C @ =gUnknown_03004094
	ldrb r0, [r5]
	cmp r0, #0
	bne _08036936
	bl sub_0801F050
	bl sub_08013510
	bl sub_08054B7C
	bl sub_08019470
	bl sub_08015954
	ldr r4, _08036940 @ =gProcTreeRootArray
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
	bl sub_0801F06C
	bl sub_0801F084
	bl sub_0803B404
	movs r0, #1
	strb r0, [r5]
_08036936:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803693C: .4byte gUnknown_03004094
_08036940: .4byte gProcTreeRootArray

