	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035740
sub_08035740: @ 0x08035740
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803575C @ =gUnknown_0849BE38
	bl Proc_Find
	cmp r0, #0
	beq _08035754
	adds r1, r4, #0
	bl sub_08035760
_08035754:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803575C: .4byte gUnknown_0849BE38

