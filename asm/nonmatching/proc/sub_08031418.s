	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031418
sub_08031418: @ 0x08031418
	push {lr}
	adds r1, r0, #0
	ldr r0, _0803142C @ =gUnknown_0849B284
	bl Proc_Start
	movs r1, #0
	str r1, [r0, #0x58]
	pop {r0}
	bx r0
	.align 2, 0
_0803142C: .4byte gUnknown_0849B284

