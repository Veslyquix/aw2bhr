	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08053F50
sub_08053F50: @ 0x08053F50
	push {r4, lr}
	ldr r4, _08053F8C @ =gUnknown_0300450C
	ldrh r0, [r4]
	bl sub_08053FBC
	ldrh r0, [r4]
	bl sub_0805414C
	movs r0, #0
	bl sub_08054278
	movs r0, #1
	bl sub_08054278
	movs r0, #0
	bl sub_08054488
	movs r0, #1
	bl sub_08054488
	movs r0, #0
	bl sub_08053660
	movs r0, #1
	bl sub_08053660
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053F8C: .4byte gUnknown_0300450C

