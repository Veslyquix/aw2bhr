	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C27C
sub_0801C27C: @ 0x0801C27C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	movs r2, #0
	cmp r4, #0
	beq _0801C2D2
	ldr r0, [r4]
	cmp r0, #0
	beq _0801C2D2
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _0801C2A6
	adds r0, r4, #0
	bl sub_0801C3EC
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	lsls r2, r0, #9
_0801C2A6:
	ldrh r0, [r4, #0x1e]
	orrs r2, r5
	ldr r3, [r4, #0x10]
	ldrh r1, [r4, #0x22]
	str r1, [sp]
	adds r1, r2, #0
	adds r2, r6, #0
	bl PutSpriteExt
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _0801C2D2
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801C2D2
	adds r0, r4, #0
	bl sub_0801C53C
_0801C2D2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

