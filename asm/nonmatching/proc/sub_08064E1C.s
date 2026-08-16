	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064E1C
sub_08064E1C: @ 0x08064E1C
	push {r4, lr}
	sub sp, #4
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, _08064E54 @ =gUnknown_08580934
	ldr r0, [r0]
	adds r0, #0xd
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #0x3d
	subs r3, #0x1e
	ldr r1, _08064E58 @ =0x000001FF
	ands r3, r1
	adds r4, #0x10
	movs r1, #0xff
	ands r4, r1
	movs r1, #0
	str r1, [sp]
	adds r1, r3, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_0801F34C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064E54: .4byte gUnknown_08580934
_08064E58: .4byte 0x000001FF

