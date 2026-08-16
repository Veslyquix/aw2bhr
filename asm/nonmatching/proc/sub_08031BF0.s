	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031BF0
sub_08031BF0: @ 0x08031BF0
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _08031C14 @ =gUnknown_02000000
	movs r1, #0
	bl sub_080337D8
	ldr r4, _08031C18 @ =gUnknown_0849B060
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #0xa
	movs r2, #2
	bl sub_080315E8
	ldr r1, [r4]
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031C14: .4byte gUnknown_02000000
_08031C18: .4byte gUnknown_0849B060

