	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037124
sub_08037124: @ 0x08037124
	push {lr}
	bl sub_080169E8
	ldr r0, _08037144 @ =gUnknown_08553820
	bl sub_0801537C
	ldr r0, _08037148 @ =gUnknown_0855379C
	bl Proc_EndEach
	ldr r0, _0803714C @ =gUnknown_0849D3BC
	bl Proc_EndEach
	bl sub_08036B34
	pop {r0}
	bx r0
	.align 2, 0
_08037144: .4byte gUnknown_08553820
_08037148: .4byte gUnknown_0855379C
_0803714C: .4byte gUnknown_0849D3BC

