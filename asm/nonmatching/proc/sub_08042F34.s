	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042F34
sub_08042F34: @ 0x08042F34
	adds r2, r0, #0
	ldr r0, _08042F50 @ =gUnknown_03003FC0
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _08042F58
	ldr r0, _08042F54 @ =gUnknown_085D3DD0
	lsls r1, r2, #6
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #8
	ldrsh r0, [r1, r2]
	b _08042F5A
	.align 2, 0
_08042F50: .4byte gUnknown_03003FC0
_08042F54: .4byte gUnknown_085D3DD0
_08042F58:
	movs r0, #0
_08042F5A:
	bx lr

