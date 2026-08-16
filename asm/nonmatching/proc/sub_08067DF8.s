	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067DF8
sub_08067DF8: @ 0x08067DF8
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r2, [r1]
	ldr r1, _08067E18 @ =gUnknown_08581104
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r2, #0
	bl sub_08043BF8
	pop {r0}
	bx r0
	.align 2, 0
_08067E18: .4byte gUnknown_08581104

