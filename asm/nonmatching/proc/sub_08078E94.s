	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078E94
sub_08078E94: @ 0x08078E94
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #9
	bl sub_0803B3D4
	bl sub_08078E20
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08078EB2
	movs r0, #0xd1
	lsls r0, r0, #1
	bl sub_0803B524
	b _08078EBA
_08078EB2:
	ldr r0, _08078EC0 @ =gUnknown_08615D70
	adds r1, r4, #0
	bl Proc_Start
_08078EBA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078EC0: .4byte gUnknown_08615D70

