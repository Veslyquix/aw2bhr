	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066340
sub_08066340: @ 0x08066340
	push {lr}
	adds r2, r0, #0
	movs r1, #0x28
	ldrsh r0, [r2, r1]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r1, _0806636C @ =0x000001FF
	ands r0, r1
	movs r3, #0x2a
	ldrsh r1, [r2, r3]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08066370 @ =gUnknown_08580CD4
	movs r3, #0
	bl sub_0801BD00
	pop {r0}
	bx r0
	.align 2, 0
_0806636C: .4byte 0x000001FF
_08066370: .4byte gUnknown_08580CD4

