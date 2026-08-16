	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031C1C
sub_08031C1C: @ 0x08031C1C
	push {r4, lr}
	sub sp, #4
	ldr r2, _08031C4C @ =gUnknown_02000000
	ldr r1, _08031C50 @ =0x00000A5C
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	bl sub_0803376C
	ldr r4, _08031C54 @ =gUnknown_0849B060
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #9
	movs r2, #2
	bl sub_080315E8
	ldr r1, [r4]
	strh r0, [r1]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031C4C: .4byte gUnknown_02000000
_08031C50: .4byte 0x00000A5C
_08031C54: .4byte gUnknown_0849B060

