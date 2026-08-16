	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044C80
sub_08044C80: @ 0x08044C80
	push {r4, r5, r6, lr}
	sub sp, #0x14
	ldr r6, _08044CAC @ =gUnknown_084A0994
	ldr r1, _08044CB0 @ =gUnknown_0811315C
	ldr r2, _08044CB4 @ =gUnknown_08113BA0
	ldr r3, _08044CB8 @ =gUnknown_030033EC
	ldrh r3, [r3]
	movs r5, #1
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	subs r4, #1
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r6, #0
	bl sub_08044D70
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08044CAC: .4byte gUnknown_084A0994
_08044CB0: .4byte gUnknown_0811315C
_08044CB4: .4byte gUnknown_08113BA0
_08044CB8: .4byte gUnknown_030033EC

