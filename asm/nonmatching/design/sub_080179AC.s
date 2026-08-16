	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080179AC
sub_080179AC: @ 0x080179AC
	push {lr}
	sub sp, #8
	ldr r0, _080179CC @ =gUnknown_08499588
	ldr r0, [r0]
	movs r1, #6
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r2, #0
	movs r3, #0x1e
	bl sub_08012BC8
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080179CC: .4byte gUnknown_08499588

