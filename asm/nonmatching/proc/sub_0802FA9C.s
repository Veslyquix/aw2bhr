	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802FA9C
sub_0802FA9C: @ 0x0802FA9C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _0802FAC8 @ =gUnknown_08090CA0
	mov r0, sp
	movs r2, #8
	bl sub_0808B6E8
	lsls r4, r4, #1
	mov r1, sp
	adds r0, r1, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0803B4DC
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802FAC8: .4byte gUnknown_08090CA0

