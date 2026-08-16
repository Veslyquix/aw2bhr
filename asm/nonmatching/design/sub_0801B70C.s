	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B70C
sub_0801B70C: @ 0x0801B70C
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r3, _0801B720 @ =gUnknown_03006029
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
_0801B720: .4byte gUnknown_03006029

