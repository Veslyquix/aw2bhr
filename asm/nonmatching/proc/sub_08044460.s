	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044460
sub_08044460: @ 0x08044460
	adds r3, r0, #0
	ldrb r1, [r3, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0804447C
	ldr r2, _08044480 @ =gUnknown_085D5ABC
	ldrb r1, [r3]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x18]
	cmp r0, #0
	beq _08044484
_0804447C:
	movs r0, #0
	b _08044486
	.align 2, 0
_08044480: .4byte gUnknown_085D5ABC
_08044484:
	movs r0, #1
_08044486:
	bx lr

