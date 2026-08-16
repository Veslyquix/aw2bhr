	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066B8C
sub_08066B8C: @ 0x08066B8C
	push {r4, lr}
	ldr r1, _08066BF0 @ =gUnknown_08580934
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r1, #0x54
	adds r1, r1, r0
	ldr r4, [r1]
	adds r0, r4, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #1
	beq _08066BAE
	adds r0, r4, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #0
	beq _08066BBE
_08066BAE:
	movs r1, #0x28
	ldrsh r0, [r4, r1]
	adds r0, #0xa
	movs r2, #0x2a
	ldrsh r1, [r4, r2]
	subs r1, #0x10
	bl sub_08064474
_08066BBE:
	adds r0, r4, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #1
	beq _08066BD8
	adds r0, r4, #0
	adds r0, #0x48
	ldrb r1, [r0]
	adds r0, #3
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _08066BE8
_08066BD8:
	movs r1, #0x28
	ldrsh r0, [r4, r1]
	adds r0, #0xa
	movs r2, #0x2a
	ldrsh r1, [r4, r2]
	adds r1, #0x1f
	bl sub_08064500
_08066BE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066BF0: .4byte gUnknown_08580934

