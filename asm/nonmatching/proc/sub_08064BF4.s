	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064BF4
sub_08064BF4: @ 0x08064BF4
	push {r4, lr}
	sub sp, #4
	ldr r1, _08064C2C @ =gUnknown_08580934
	ldr r1, [r1]
	adds r1, #0x11
	ldrh r2, [r0, #0x1c]
	adds r1, r1, r2
	ldrb r3, [r1]
	adds r3, #0xbd
	ldrh r2, [r0, #0x28]
	ldr r1, _08064C30 @ =0x000001FF
	ands r1, r2
	movs r4, #0x2a
	ldrsh r2, [r0, r4]
	adds r2, #0xc
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	str r0, [sp]
	adds r0, r3, #0
	movs r3, #0
	bl sub_0801F34C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064C2C: .4byte gUnknown_08580934
_08064C30: .4byte 0x000001FF

