	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067504
sub_08067504: @ 0x08067504
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08067528 @ =sProcArray
	movs r5, #0x1f
_0806750C:
	ldr r0, [r4]
	cmp r0, r6
	bne _08067518
	adds r0, r4, #0
	bl Proc_Break
_08067518:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _0806750C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08067528: .4byte sProcArray

