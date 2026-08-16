	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057138
sub_08057138: @ 0x08057138
	push {lr}
	movs r0, #0
	bl sub_080566C8
	movs r0, #0
	bl sub_0804C0FC
	movs r0, #1
	bl sub_0804C0FC
	ldr r0, _0805715C @ =gUnknown_08552680
	ldr r1, _08057160 @ =0x05000340
	movs r2, #0x10
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_0805715C: .4byte gUnknown_08552680
_08057160: .4byte 0x05000340

