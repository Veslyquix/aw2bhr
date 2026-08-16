	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C9E8
sub_0800C9E8: @ 0x0800C9E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r5, #0
	movs r0, #0x28
	bl sub_0800C958
	mov r8, r0
	cmp r0, #0
	bne _0800CA0C
	movs r0, #1
	bl sub_08025308
	cmp r0, #0
	ble _0800CA14
	movs r5, #1
	mov r8, r5
	b _0800CA14
_0800CA0C:
	mov r0, r8
	cmp r0, #0
	ble _0800CA14
	movs r5, #1
_0800CA14:
	movs r0, #0x48
	bl sub_0800C958
	adds r7, r0, #0
	cmp r7, #0
	bne _0800CA30
	movs r0, #2
	bl sub_08025308
	cmp r0, #0
	ble _0800CA36
	adds r5, #1
	movs r7, #1
	b _0800CA36
_0800CA30:
	cmp r7, #0
	ble _0800CA36
	adds r5, #1
_0800CA36:
	movs r0, #0x68
	bl sub_0800C958
	adds r6, r0, #0
	cmp r6, #0
	bne _0800CA52
	movs r0, #3
	bl sub_08025308
	cmp r0, #0
	ble _0800CA58
	adds r5, #1
	movs r6, #1
	b _0800CA58
_0800CA52:
	cmp r6, #0
	ble _0800CA58
	adds r5, #1
_0800CA58:
	movs r0, #0x88
	bl sub_0800C958
	adds r4, r0, #0
	cmp r4, #0
	bne _0800CA74
	movs r0, #4
	bl sub_08025308
	cmp r0, #0
	ble _0800CA7A
	adds r5, #1
	movs r4, #1
	b _0800CA7A
_0800CA74:
	cmp r4, #0
	ble _0800CA7A
	adds r5, #1
_0800CA7A:
	movs r0, #0
	mov r1, r8
	cmp r1, #0
	beq _0800CA94
	cmp r7, #0
	beq _0800CA94
	cmp r6, #0
	beq _0800CA94
	cmp r4, #0
	beq _0800CA94
	cmp r5, #1
	ble _0800CA94
	movs r0, #1
_0800CA94:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

