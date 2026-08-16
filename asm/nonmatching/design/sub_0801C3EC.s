	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C3EC
sub_0801C3EC: @ 0x0801C3EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #4]
	cmp r0, #0
	beq _0801C4BC
	ldr r0, [r0]
	cmp r0, #0
	beq _0801C4BC
	ldr r0, [sp, #4]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0801C4BC
	ldrh r0, [r1]
	ldr r2, _0801C4CC @ =0x00007FFF
	ands r2, r0
	str r2, [sp, #8]
	adds r7, r1, #2
	movs r0, #0
	mov r8, r0
	cmp r8, r2
	bge _0801C4BC
	ldr r1, _0801C4D0 @ =gSinLut
	mov sb, r1
	movs r2, #0xff
	mov sl, r2
_0801C426:
	ldrh r1, [r7]
	mov r0, sl
	ands r0, r1
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	ldrh r1, [r7, #2]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldrh r1, [r7]
	mov r0, sl
	ands r0, r1
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldrh r1, [r7, #4]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldrh r1, [r7]
	mov r0, sl
	ands r0, r1
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	ldrh r1, [r7, #2]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldrh r1, [r7]
	mov r0, sl
	ands r0, r1
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	ldrh r1, [r7, #4]
	bl Div
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [sp, #4]
	adds r0, #0x21
	ldrb r0, [r0]
	add r0, r8
	str r1, [sp]
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	adds r7, #6
	movs r0, #1
	add r8, r0
	ldr r1, [sp, #8]
	cmp r8, r1
	blt _0801C426
_0801C4BC:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801C4CC: .4byte 0x00007FFF
_0801C4D0: .4byte gSinLut

