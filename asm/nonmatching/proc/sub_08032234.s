	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032234
sub_08032234: @ 0x08032234
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08032274 @ =gUnknown_03002EE0
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803224C
	movs r0, #0x68
	bl sub_0803B4DC
_0803224C:
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0803226C
	ldr r0, _08032278 @ =gUnknown_0849B060
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	strb r0, [r1, #9]
	movs r0, #0x71
	bl sub_0803B4DC
	adds r0, r5, #0
	bl Proc_Break
_0803226C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032274: .4byte gUnknown_03002EE0
_08032278: .4byte gUnknown_0849B060

