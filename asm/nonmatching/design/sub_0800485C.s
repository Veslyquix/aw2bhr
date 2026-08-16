	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800485C
sub_0800485C: @ 0x0800485C
	push {lr}
	bl sub_0801A664
	movs r0, #0x66
	bl sub_0803B4DC
	ldr r0, _08004878 @ =gUnknown_0200B0B0
	ldr r1, [r0]
	movs r0, #3
	strh r0, [r1, #4]
	bl sub_08004C5C
	pop {r0}
	bx r0
	.align 2, 0
_08004878: .4byte gUnknown_0200B0B0

