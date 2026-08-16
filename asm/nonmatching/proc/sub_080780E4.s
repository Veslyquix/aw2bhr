	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080780E4
sub_080780E4: @ 0x080780E4
	push {lr}
	bl sub_0801F00C
	ldr r0, _08078114 @ =sub_08036884
	bl sub_080366D0
	ldr r0, _08078118 @ =sub_080368E8
	bl sub_080366C4
	bl sub_08036B4C
	bl sub_080745C0
	ldr r2, _0807811C @ =gDispIo
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08078120 @ =gUnknown_086147FC
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08078114: .4byte sub_08036884
_08078118: .4byte sub_080368E8
_0807811C: .4byte gDispIo
_08078120: .4byte gUnknown_086147FC

