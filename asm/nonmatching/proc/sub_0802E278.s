	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E278
sub_0802E278: @ 0x0802E278
	push {r4, lr}
	bl sub_08023824
	bl sub_08023518
	movs r0, #8
	bl sub_08023908
	bl sub_0802DBF8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802E2AC
	ldr r0, _0802E2B4 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0802E2AC
	bl sub_08012358
	ldr r0, _0802E2B8 @ =gUnknown_03003334
	strh r4, [r0]
_0802E2AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E2B4: .4byte gUnknown_03002EE0
_0802E2B8: .4byte gUnknown_03003334

