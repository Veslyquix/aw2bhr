	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080130B0
sub_080130B0: @ 0x080130B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080130C4 @ =gUnknown_084892C4
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080130C4: .4byte gUnknown_084892C4

