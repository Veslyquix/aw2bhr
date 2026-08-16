	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08010EC4
sub_08010EC4: @ 0x08010EC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08010EDC @ =gUnknown_08489200
	ldr r1, _08010EE0 @ =gUnknown_03003050
	movs r2, #0x3d
	bl sub_0808B6E8
	ldr r0, _08010EE4 @ =gUnknown_03007FFC
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010EDC: .4byte gUnknown_08489200
_08010EE0: .4byte gUnknown_03003050
_08010EE4: .4byte gUnknown_03007FFC

