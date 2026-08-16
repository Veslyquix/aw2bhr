	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078038
sub_08078038: @ 0x08078038
	push {r4, r5, lr}
	sub sp, #8
	movs r4, #0
	str r4, [sp]
	ldr r0, _0807806C @ =gUnknown_08499578
	ldr r1, [r0]
	ldr r5, _08078070 @ =0x01000200
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _08078074 @ =gUnknown_08499580
	ldr r1, [r1]
	adds r2, r5, #0
	bl CpuFastSet
	bl sub_08013AEC
	bl sub_08013B0C
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807806C: .4byte gUnknown_08499578
_08078070: .4byte 0x01000200
_08078074: .4byte gUnknown_08499580

