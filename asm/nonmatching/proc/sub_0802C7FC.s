	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C7FC
sub_0802C7FC: @ 0x0802C7FC
	ldr r1, _0802C814 @ =gUnknown_085C77A0
	ldr r0, _0802C818 @ =gUnknown_03003FC0
	ldrb r2, [r0, #2]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0802C81C
	movs r0, #1
	b _0802C81E
	.align 2, 0
_0802C814: .4byte gUnknown_085C77A0
_0802C818: .4byte gUnknown_03003FC0
_0802C81C:
	movs r0, #0
_0802C81E:
	bx lr

