	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E698
sub_0802E698: @ 0x0802E698
	push {lr}
	ldr r1, _0802E6B8 @ =gUnknown_03003100
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl sub_08022AAC
	bl sub_0802D558
	ldr r1, _0802E6BC @ =gUnknown_03003334
	movs r0, #4
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802E6B8: .4byte gUnknown_03003100
_0802E6BC: .4byte gUnknown_03003334

