	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08009B84
sub_08009B84: @ 0x08009B84
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl sub_0800A6AC
	adds r4, r0, #0
	cmp r4, #0
	bne _08009BB2
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800A884
	adds r4, r0, #0
	cmp r4, #0
	beq _08009BEA
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800A95C
	adds r1, r0, #0
	cmp r1, #0
	beq _08009BEA
	b _08009BE8
_08009BB2:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800A95C
	adds r1, r0, #0
	cmp r1, #0
	beq _08009BEA
	movs r3, #0xfe
	lsls r3, r3, #8
	adds r2, r4, #0
	ands r2, r3
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r2, r0
	bne _08009BD2
	adds r4, r1, #0
_08009BD2:
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r2, r0
	bne _08009BE4
	adds r0, r4, #0
	ands r0, r3
	cmp r0, r2
	bne _08009BE4
	adds r4, r1, #0
_08009BE4:
	cmp r2, #0
	bne _08009BEA
_08009BE8:
	adds r4, r1, #0
_08009BEA:
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

