	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044CBC
sub_08044CBC: @ 0x08044CBC
	push {r4, r5, r6, lr}
	sub sp, #0x14
	ldr r6, _08044CE8 @ =gUnknown_084A0994
	ldr r1, _08044CEC @ =gUnknown_0811315C
	ldr r2, _08044CF0 @ =gUnknown_08113BC0
	ldr r3, _08044CF4 @ =gUnknown_030033EC
	ldrh r3, [r3]
	movs r5, #2
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r4, #1
	str r4, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r6, #0
	bl sub_08044D70
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08044CE8: .4byte gUnknown_084A0994
_08044CEC: .4byte gUnknown_0811315C
_08044CF0: .4byte gUnknown_08113BC0
_08044CF4: .4byte gUnknown_030033EC

