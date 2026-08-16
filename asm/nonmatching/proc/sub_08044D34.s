	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044D34
sub_08044D34: @ 0x08044D34
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r5, _08044D60 @ =gUnknown_084A0994
	ldr r1, _08044D64 @ =gUnknown_081133D0
	ldr r2, _08044D68 @ =gUnknown_08113BC0
	ldr r3, _08044D6C @ =gUnknown_030033EC
	ldrh r3, [r3]
	movs r4, #2
	str r4, [sp]
	str r4, [sp, #4]
	subs r4, #3
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
_08044D60: .4byte gUnknown_084A0994
_08044D64: .4byte gUnknown_081133D0
_08044D68: .4byte gUnknown_08113BC0
_08044D6C: .4byte gUnknown_030033EC

