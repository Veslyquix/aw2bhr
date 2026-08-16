	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C2B4
sub_0802C2B4: @ 0x0802C2B4
	push {lr}
	ldr r0, _0802C2D0 @ =gUnknown_0849A990
	movs r1, #0
	bl sub_080152EC
	ldr r2, _0802C2D4 @ =gDispIo
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_0802C2D0: .4byte gUnknown_0849A990
_0802C2D4: .4byte gDispIo

