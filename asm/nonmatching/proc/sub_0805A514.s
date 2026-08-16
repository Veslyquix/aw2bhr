	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805A514
sub_0805A514: @ 0x0805A514
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, _0805A5CC @ =gUnknown_0816D994
	ldr r1, [r0]
	ldrh r5, [r1]
	adds r1, r5, #0
	adds r1, #0x40
	mov sb, r0
	cmp r5, r1
	bge _0805A5BA
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r3, r0, #2
_0805A53C:
	ldr r0, _0805A5D0 @ =gUnknown_08499594
	ldr r0, [r0]
	adds r4, r0, r3
	ldrb r0, [r4]
	cmp r0, #0
	beq _0805A5AA
	ldrb r1, [r4, #9]
	movs r0, #0x38
	ands r0, r1
	cmp r0, #0x18
	bne _0805A5AA
	ldr r0, _0805A5D4 @ =gUnknown_03004730
	movs r1, #0x3f
	ands r1, r5
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805A5AA
	ldr r7, _0805A5D8 @ =gUnknown_03003340
	ldrb r1, [r4, #3]
	lsls r0, r1, #2
	adds r0, r0, r7
	ldrb r2, [r4, #2]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r8
	beq _0805A5AA
	adds r0, r2, #0
	mov r2, sp
	str r3, [sp, #4]
	bl sub_0805ACA8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [sp, #4]
	cmp r0, #1
	bne _0805A5AA
	ldrb r0, [r4, #2]
	strb r0, [r6]
	ldrb r0, [r4, #3]
	strb r0, [r6, #1]
	ldrb r0, [r4, #3]
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrb r1, [r4, #2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r6, #2]
	adds r6, #4
_0805A5AA:
	adds r3, #0xc
	adds r5, #1
	mov r1, sb
	ldr r0, [r1]
	ldrh r0, [r0]
	adds r0, #0x40
	cmp r5, r0
	blt _0805A53C
_0805A5BA:
	ldr r0, _0805A5DC @ =0x0000FFFF
	strh r0, [r6, #2]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A5CC: .4byte gUnknown_0816D994
_0805A5D0: .4byte gUnknown_08499594
_0805A5D4: .4byte gUnknown_03004730
_0805A5D8: .4byte gUnknown_03003340
_0805A5DC: .4byte 0x0000FFFF

