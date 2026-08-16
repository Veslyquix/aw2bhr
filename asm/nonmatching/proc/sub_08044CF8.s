	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044CF8
sub_08044CF8: @ 0x08044CF8
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r5, _08044D24 @ =gUnknown_084A0994
	ldr r1, _08044D28 @ =gUnknown_081133D0
	ldr r2, _08044D2C @ =gUnknown_08113BA0
	ldr r3, _08044D30 @ =gUnknown_030033EC
	ldrh r3, [r3]
	movs r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	subs r4, #2
	str r4, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl sub_08044D70
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08044D24: .4byte gUnknown_084A0994
_08044D28: .4byte gUnknown_081133D0
_08044D2C: .4byte gUnknown_08113BA0
_08044D30: .4byte gUnknown_030033EC

