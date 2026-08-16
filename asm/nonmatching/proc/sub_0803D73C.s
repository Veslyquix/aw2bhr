	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D73C
sub_0803D73C: @ 0x0803D73C
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0
	beq _0803D754
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0
	bl sub_08016CEC
_0803D754:
	ldr r0, _0803D76C @ =gUnknown_0849F330
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x64
	strh r4, [r1]
	str r5, [r0, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803D76C: .4byte gUnknown_0849F330

