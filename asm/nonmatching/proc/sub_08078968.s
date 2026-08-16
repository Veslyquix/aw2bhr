	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078968
sub_08078968: @ 0x08078968
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xd0
	lsls r0, r0, #2
	bl sub_0801B780
	ldr r0, _08078984 @ =gUnknown_08615BBC
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078984: .4byte gUnknown_08615BBC

