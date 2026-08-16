	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078078
sub_08078078: @ 0x08078078
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r0, _08078098 @ =gUnknown_0849957C
	ldr r1, [r0]
	ldr r2, _0807809C @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	bl sub_08013AFC
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08078098: .4byte gUnknown_0849957C
_0807809C: .4byte 0x01000200

