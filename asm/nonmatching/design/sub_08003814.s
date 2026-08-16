	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003814
sub_08003814: @ 0x08003814
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _08003888 @ =gUnknown_0200B0B0
	mov r8, r0
	ldr r0, [r0]
	movs r1, #0x3e
	ldrsh r0, [r0, r1]
	movs r7, #0xce
	cmp r0, #0
	bne _0800382E
	movs r7, #2
_0800382E:
	ldr r6, _0800388C @ =0x000001FF
	adds r4, r7, #0
	ands r4, r6
	movs r5, #0
	str r5, [sp]
	movs r0, #0x91
	adds r1, r4, #0
	movs r2, #0xe
	movs r3, #0
	bl sub_0801F34C
	str r5, [sp]
	movs r0, #0x90
	adds r1, r4, #0
	movs r2, #0x18
	movs r3, #0
	bl sub_0801F34C
	adds r4, r7, #0
	adds r4, #0x18
	ands r4, r6
	mov r1, r8
	ldr r0, [r1]
	movs r1, #8
	ldrsh r2, [r0, r1]
	adds r2, #1
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_0802BD54
	mov r1, r8
	ldr r0, [r1]
	movs r1, #0xa
	ldrsh r2, [r0, r1]
	adds r2, #1
	adds r0, r4, #0
	movs r1, #0x18
	bl sub_0802BD54
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003888: .4byte gUnknown_0200B0B0
_0800388C: .4byte 0x000001FF

