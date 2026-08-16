	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080656E0
sub_080656E0: @ 0x080656E0
	push {lr}
	ldr r0, _080656FC @ =gUnknown_08580C7C
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
_080656FC: .4byte gUnknown_08580C7C

