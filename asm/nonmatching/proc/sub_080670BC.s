	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080670BC
sub_080670BC: @ 0x080670BC
	push {lr}
	ldr r0, _080670D0 @ =gUnknown_0202F200
	movs r1, #1
	strb r1, [r0]
	ldr r0, _080670D4 @ =gUnknown_08580DD8
	movs r1, #2
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_080670D0: .4byte gUnknown_0202F200
_080670D4: .4byte gUnknown_08580DD8

