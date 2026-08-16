	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042C24
sub_08042C24: @ 0x08042C24
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x14]
	cmp r1, #7
	bgt _08042C40
	ldr r0, _08042C3C @ =gUnknown_0849FCA4
	bl Proc_Start
	b _08042C46
	.align 2, 0
_08042C3C: .4byte gUnknown_0849FCA4
_08042C40:
	ldr r0, _08042C64 @ =gUnknown_0849FCA4
	bl Proc_StartBlocking
_08042C46:
	adds r1, r0, #0
	adds r0, r1, #0
	adds r0, #0x64
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	str r6, [r1, #0x2c]
	str r7, [r1, #0x30]
	adds r1, #0x4a
	movs r0, #0x1e
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042C64: .4byte gUnknown_0849FCA4

