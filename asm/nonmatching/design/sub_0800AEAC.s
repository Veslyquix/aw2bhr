	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800AEAC
sub_0800AEAC: @ 0x0800AEAC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl sub_0800A6AC
	adds r4, r0, #0
	cmp r4, #0
	blt _0800AF1A
	cmp r4, #0
	beq _0800AEEE
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800A95C
	cmp r0, #0
	beq _0800AEEA
	cmp r0, #0
	ble _0800AF1A
	movs r1, #0xfe
	lsls r1, r1, #8
	ands r1, r4
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	beq _0800AEEA
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r1, r0
	beq _0800AEEA
	cmp r1, #0
	bne _0800AF1A
_0800AEEA:
	movs r0, #1
	b _0800AF1C
_0800AEEE:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800A6AC
	cmp r0, #0
	blt _0800AF1A
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800A884
	adds r4, r0, #0
	cmp r4, #0
	beq _0800AF1A
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800A95C
	cmp r0, #0
	beq _0800AF16
	adds r4, r0, #0
_0800AF16:
	cmp r4, #0
	bgt _0800AEEA
_0800AF1A:
	movs r0, #0
_0800AF1C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

