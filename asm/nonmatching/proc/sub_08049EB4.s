	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049EB4
sub_08049EB4: @ 0x08049EB4
	push {r4, lr}
	ldr r0, _08049EDC @ =gUnknown_084C325C
	bl sub_0801537C
	ldr r4, _08049EE0 @ =gUnknown_084C3244
	adds r0, r4, #0
	bl sub_0801537C
	adds r0, r4, #0
	bl sub_0801537C
	adds r0, r4, #0
	bl sub_0801537C
	adds r0, r4, #0
	bl sub_0801537C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049EDC: .4byte gUnknown_084C325C
_08049EE0: .4byte gUnknown_084C3244

