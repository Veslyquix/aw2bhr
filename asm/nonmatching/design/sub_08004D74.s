	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004D74
sub_08004D74: @ 0x08004D74
	push {lr}
	ldr r2, _08004D88 @ =gUnknown_08610A38
	ldr r3, _08004D8C @ =0x000027E8
	adds r2, r2, r3
	ldr r2, [r2]
	movs r3, #0
	bl sub_08004DD4
	pop {r0}
	bx r0
	.align 2, 0
_08004D88: .4byte gUnknown_08610A38
_08004D8C: .4byte 0x000027E8

