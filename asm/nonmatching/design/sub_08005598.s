	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005598
sub_08005598: @ 0x08005598
	push {lr}
	ldr r0, _080055B0 @ =gUnknown_0200B0B0
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #2]
	ldr r0, _080055B4 @ =gUnknown_0848846C
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_080055B0: .4byte gUnknown_0200B0B0
_080055B4: .4byte gUnknown_0848846C

