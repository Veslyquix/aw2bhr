	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019D78
sub_08019D78: @ 0x08019D78
	push {lr}
	sub sp, #8
	bl sub_08019D48
	ldr r0, _08019DA4 @ =gUnknown_08499580
	ldr r0, [r0]
	movs r1, #0x14
	str r1, [sp]
	movs r1, #0xd8
	lsls r1, r1, #2
	str r1, [sp, #4]
	movs r1, #0
	movs r2, #0
	movs r3, #0x20
	bl sub_08012BC8
	movs r0, #2
	bl sub_08013AD4
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_08019DA4: .4byte gUnknown_08499580

