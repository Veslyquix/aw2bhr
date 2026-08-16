	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064DDC
sub_08064DDC: @ 0x08064DDC
	push {r4, lr}
	sub sp, #4
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, _08064E14 @ =gUnknown_08580934
	ldr r0, [r0]
	adds r0, #9
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #2
	bne _08064DF4
	movs r2, #4
_08064DF4:
	adds r0, r2, #0
	adds r0, #0x4a
	adds r1, r3, #0
	adds r1, #8
	ldr r2, _08064E18 @ =0x000001FF
	ands r1, r2
	movs r2, #0xff
	ands r2, r4
	movs r3, #0
	str r3, [sp]
	bl sub_0801F34C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064E14: .4byte gUnknown_08580934
_08064E18: .4byte 0x000001FF

