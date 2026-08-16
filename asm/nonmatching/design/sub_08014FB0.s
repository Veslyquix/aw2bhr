	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014FB0
sub_08014FB0: @ 0x08014FB0
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, _08014FD4 @ =gUnknown_03000050
	ldr r0, [r0]
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	beq _08014FD0
	adds r4, r2, #0
	muls r4, r1, r4
	adds r0, r4, #0
	bl sub_08014E44
	adds r2, r0, #0
	cmp r2, #0
	bne _08014FD8
_08014FD0:
	movs r0, #0
	b _08014FF0
	.align 2, 0
_08014FD4: .4byte gUnknown_03000050
_08014FD8:
	adds r1, r2, #0
	subs r0, r4, #1
	cmp r0, r5
	beq _08014FEE
	movs r4, #0
	adds r3, r5, #0
_08014FE4:
	strb r4, [r1]
	adds r1, #1
	subs r0, #1
	cmp r0, r3
	bne _08014FE4
_08014FEE:
	adds r0, r2, #0
_08014FF0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

