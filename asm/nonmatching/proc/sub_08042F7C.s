	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042F7C
sub_08042F7C: @ 0x08042F7C
	adds r2, r0, #0
	ldr r0, _08042F98 @ =gUnknown_03003FC0
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _08042FA0
	ldr r0, _08042F9C @ =gUnknown_085D3DD0
	lsls r1, r2, #6
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #6
	ldrsh r0, [r1, r2]
	b _08042FA2
	.align 2, 0
_08042F98: .4byte gUnknown_03003FC0
_08042F9C: .4byte gUnknown_085D3DD0
_08042FA0:
	movs r0, #0
_08042FA2:
	bx lr

