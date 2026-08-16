	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004C10
sub_08004C10: @ 0x08004C10
	push {lr}
	bl sub_080037AC
	ldr r0, _08004C30 @ =gUnknown_0200B0B0
	ldr r1, [r0]
	movs r0, #2
	strh r0, [r1, #2]
	adds r2, r1, #0
	adds r2, #0x46
	movs r0, #0x15
	strh r0, [r2]
	adds r1, #0x48
	movs r0, #0x18
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08004C30: .4byte gUnknown_0200B0B0

