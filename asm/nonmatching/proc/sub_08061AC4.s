	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061AC4
sub_08061AC4: @ 0x08061AC4
	push {lr}
	ldr r0, _08061AF4 @ =gUnknown_030044D8
	ldrb r0, [r0]
	cmp r0, #1
	beq _08061AEE
	bl sub_08042B9C
	ldr r0, _08061AF8 @ =gUnknown_03004780
	movs r1, #0
	strh r1, [r0]
	ldr r1, _08061AFC @ =gUnknown_03003FC0
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08061AEE
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	bl sub_080344F0
_08061AEE:
	pop {r0}
	bx r0
	.align 2, 0
_08061AF4: .4byte gUnknown_030044D8
_08061AF8: .4byte gUnknown_03004780
_08061AFC: .4byte gUnknown_03003FC0

