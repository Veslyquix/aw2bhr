	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014E68
sub_08014E68: @ 0x08014E68
	push {r4, r5, lr}
	adds r5, r0, #0
	cmp r1, #0
	beq _08014E80
	adds r2, r1, #0
	subs r2, #0x10
	adds r3, r2, #0
	adds r0, r1, #0
	subs r0, #8
	ldr r0, [r0]
	cmp r0, #0
	bne _08014E84
_08014E80:
	movs r0, #1
	b _08014ECE
_08014E84:
	ldr r4, [r2]
	adds r0, r1, #0
	subs r0, #0xc
	ldr r1, [r0]
	adds r2, r4, #0
	cmp r2, #0
	beq _08014EA0
	ldr r0, [r2, #8]
	cmp r0, #0
	bne _08014EA0
	adds r1, #0x10
	ldr r0, [r2, #4]
	adds r1, r1, r0
	ldr r4, [r2]
_08014EA0:
	adds r2, r5, #0
	b _08014EA6
_08014EA4:
	adds r2, r0, #0
_08014EA6:
	ldr r0, [r2]
	cmp r0, r3
	bne _08014EBC
	ldr r0, [r2, #8]
	cmp r0, #0
	bne _08014EC4
	adds r3, r2, #0
	adds r1, #0x10
	ldr r0, [r3, #4]
	adds r1, r1, r0
	b _08014EC4
_08014EBC:
	cmp r2, r3
	bhi _08014EC4
	cmp r0, #0
	bne _08014EA4
_08014EC4:
	adds r2, r3, #0
	str r4, [r2]
	str r1, [r2, #4]
	movs r0, #0
	str r0, [r2, #8]
_08014ECE:
	pop {r4, r5}
	pop {r1}
	bx r1

