	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F178
sub_0801F178: @ 0x0801F178
	push {lr}
	ldr r3, _0801F198 @ =gUnknown_0848B738
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r3, #4
	adds r2, r2, r3
	ldr r0, [r2]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_0801F198: .4byte gUnknown_0848B738

