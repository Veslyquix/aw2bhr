	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802DFC8
sub_0802DFC8: @ 0x0802DFC8
	push {r4, lr}
	bl sub_08023824
	bl sub_080236E8
	movs r0, #4
	bl sub_08023908
	movs r0, #1
	bl sub_08023274
	ldr r0, _0802E008 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0802E000
	bl sub_08035810
	bl sub_080258CC
	bl sub_08022A08
	ldr r0, _0802E00C @ =gUnknown_03003334
	strh r4, [r0]
_0802E000:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E008: .4byte gUnknown_03002EE0
_0802E00C: .4byte gUnknown_03003334

