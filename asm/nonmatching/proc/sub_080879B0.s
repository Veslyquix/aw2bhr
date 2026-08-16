	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080879B0
sub_080879B0: @ 0x080879B0
	push {lr}
	sub sp, #8
	ldr r0, _080879D4 @ =gUnknown_08499580
	ldr r0, [r0]
	movs r1, #0xc
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #0xd
	movs r2, #4
	movs r3, #0x12
	bl sub_08012BC8
	bl sub_08013B0C
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080879D4: .4byte gUnknown_08499580

