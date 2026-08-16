	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C024
sub_0806C024: @ 0x0806C024
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r3, [r4, #0x30]
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0
	movs r1, #0x48
	movs r2, #0xf0
	bl Interpolate
	movs r1, #0
	movs r2, #0xf0
	movs r3, #0xa0
	bl sub_0806B9CC
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	cmp r0, #0x20
	bls _0806C060
	ldr r2, _0806C068 @ =gDispIo
	ldrb r1, [r2, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	bl Proc_Break
_0806C060:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C068: .4byte gDispIo

