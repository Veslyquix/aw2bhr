	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D820
sub_0806D820: @ 0x0806D820
	push {lr}
	ldr r0, _0806D83C @ =gUnknown_08581F40
	movs r1, #3
	bl sub_080152EC
	movs r1, #0x1e
	str r1, [r0, #0x28]
	subs r1, #0x1f
	str r1, [r0, #0x2c]
	adds r0, #0x44
	movs r1, #0xe
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0806D83C: .4byte gUnknown_08581F40

