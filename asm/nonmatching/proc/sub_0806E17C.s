	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E17C
sub_0806E17C: @ 0x0806E17C
	push {lr}
	ldr r0, _0806E190 @ =gUnknown_0202F2C8
	movs r1, #1
	strb r1, [r0]
	ldr r0, _0806E194 @ =gUnknown_08581F7C
	movs r1, #2
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0806E190: .4byte gUnknown_0202F2C8
_0806E194: .4byte gUnknown_08581F7C

