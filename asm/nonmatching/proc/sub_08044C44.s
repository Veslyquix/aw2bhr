	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044C44
sub_08044C44: @ 0x08044C44
	push {r4, r5, r6, lr}
	sub sp, #0x14
	ldr r6, _08044C70 @ =gUnknown_084A0994
	ldr r1, _08044C74 @ =gUnknown_08112F00
	ldr r2, _08044C78 @ =gUnknown_08113BC0
	ldr r3, _08044C7C @ =gUnknown_030033EC
	ldrh r3, [r3]
	movs r4, #2
	str r4, [sp]
	movs r5, #0
	str r5, [sp, #4]
	movs r4, #1
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
_08044C70: .4byte gUnknown_084A0994
_08044C74: .4byte gUnknown_08112F00
_08044C78: .4byte gUnknown_08113BC0
_08044C7C: .4byte gUnknown_030033EC

