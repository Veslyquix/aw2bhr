	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803388C
sub_0803388C: @ 0x0803388C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, _080338BC @ =gUnknown_0849BB50
	adds r0, r4, #0
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	bne _080338B6
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	movs r1, #0x58
	str r1, [r0, #0x2c]
	lsls r1, r7, #5
	adds r1, #0x2e
	str r1, [r0, #0x38]
	str r1, [r0, #0x30]
	str r5, [r0, #0x58]
_080338B6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080338BC: .4byte gUnknown_0849BB50

