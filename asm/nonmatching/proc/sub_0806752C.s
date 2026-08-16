	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806752C
sub_0806752C: @ 0x0806752C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08067550 @ =sProcArray
	movs r5, #0x1f
_08067534:
	ldr r0, [r4]
	cmp r0, r6
	beq _08067540
	adds r0, r4, #0
	bl Proc_End
_08067540:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _08067534
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08067550: .4byte sProcArray

