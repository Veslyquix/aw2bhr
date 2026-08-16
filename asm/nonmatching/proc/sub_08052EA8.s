	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08052EA8
sub_08052EA8: @ 0x08052EA8
	push {lr}
	bl sub_0808BBA4
	bl sub_080123EC
	bl sub_08012420
	bl sub_08011C18
	bl sub_08015184
	ldr r0, _08052EE0 @ =gUnknown_08553754
	movs r1, #0
	bl sub_080152C0
_08052EC6:
	bl sub_0801E0F0
	bl sub_08015954
	bl sub_0801D924
	bl sub_08011FF0
	bl sub_08012420
	bl sub_0801D8E4
	b _08052EC6
	.align 2, 0
_08052EE0: .4byte gUnknown_08553754

