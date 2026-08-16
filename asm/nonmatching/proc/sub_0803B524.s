	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B524
sub_0803B524: @ 0x0803B524
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r6, _0803B550 @ =gUnknown_030005CA
	ldrh r1, [r6]
	lsls r5, r4, #0x10
	asrs r0, r5, #0x10
	cmp r1, r0
	beq _0803B548
	ldr r0, _0803B554 @ =gUnknown_0849E750
	bl Proc_EndEach
	lsrs r0, r5, #0x10
	bl sub_08070478
	ldr r0, _0803B558 @ =gUnknown_030005C8
	strh r4, [r0]
	strh r4, [r6]
_0803B548:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803B550: .4byte gUnknown_030005CA
_0803B554: .4byte gUnknown_0849E750
_0803B558: .4byte gUnknown_030005C8

