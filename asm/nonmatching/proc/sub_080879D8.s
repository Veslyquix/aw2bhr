	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080879D8
sub_080879D8: @ 0x080879D8
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _08087A0C @ =gUnknown_08499580
	ldr r0, [r0]
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0xd
	movs r1, #4
	movs r2, #0x12
	movs r3, #0xc
	bl sub_0801A368
	bl sub_08013B0C
	bl sub_08085F40
	ldr r0, [r4, #0x54]
	bl sub_08087C14
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087A0C: .4byte gUnknown_08499580

