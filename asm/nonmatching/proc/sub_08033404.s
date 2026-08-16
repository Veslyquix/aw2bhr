	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033404
sub_08033404: @ 0x08033404
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08033430 @ =gUnknown_03003F70
	bl sub_08062FF4
	ldr r0, _08033434 @ =gUnknown_0861429C
	bl Proc_Find
	cmp r0, #0
	bne _08033428
	ldr r0, _08033438 @ =gUnknown_08614284
	bl Proc_Find
	cmp r0, #0
	bne _08033428
	adds r0, r4, #0
	bl Proc_Break
_08033428:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033430: .4byte gUnknown_03003F70
_08033434: .4byte gUnknown_0861429C
_08033438: .4byte gUnknown_08614284

