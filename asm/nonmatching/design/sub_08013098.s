	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013098
sub_08013098: @ 0x08013098
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080130AC @ =gUnknown_0848929C
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080130AC: .4byte gUnknown_0848929C

