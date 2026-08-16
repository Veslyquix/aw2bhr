	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D88C
sub_0803D88C: @ 0x0803D88C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803D8AC @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _0803D8B4
	bl sub_0803861C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803D8B4
	ldr r1, _0803D8B0 @ =gUnknown_0849F388
	adds r0, r4, #0
	bl Proc_GotoScript
	b _0803D8BA
	.align 2, 0
_0803D8AC: .4byte gUnknown_03003FC0
_0803D8B0: .4byte gUnknown_0849F388
_0803D8B4:
	movs r0, #0xcd
	bl sub_0803B524
_0803D8BA:
	pop {r4}
	pop {r0}
	bx r0

