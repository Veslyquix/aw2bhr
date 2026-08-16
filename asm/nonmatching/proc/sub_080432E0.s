	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080432E0
sub_080432E0: @ 0x080432E0
	ldr r2, _080432F4 @ =gUnknown_085D5ABC
	movs r1, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0xe]
	cmp r0, #1
	bls _080432F8
	movs r0, #6
	b _08043302
	.align 2, 0
_080432F4: .4byte gUnknown_085D5ABC
_080432F8:
	cmp r0, #1
	beq _08043300
	movs r0, #7
	b _08043302
_08043300:
	movs r0, #5
_08043302:
	bx lr

