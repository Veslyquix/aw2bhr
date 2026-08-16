	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080123EC
sub_080123EC: @ 0x080123EC
	push {lr}
	ldr r1, _08012414 @ =gDispIo
	movs r0, #0x80
	strh r0, [r1]
	ldr r0, _08012418 @ =gUnknown_030020B4
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0801241C @ =gUnknown_03001FD0
	strh r1, [r0]
	bl sub_080122EC
	bl sub_08012358
	bl sub_0801237C
	bl sub_08013324
	pop {r0}
	bx r0
	.align 2, 0
_08012414: .4byte gDispIo
_08012418: .4byte gUnknown_030020B4
_0801241C: .4byte gUnknown_03001FD0

