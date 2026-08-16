	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805BC7C
sub_0805BC7C: @ 0x0805BC7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	adds r7, r1, #0
	mov sl, r2
	ldr r0, _0805BD20 @ =gUnknown_030040D8
	ldr r1, [r0]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _0805BD2C
	ldr r2, _0805BD24 @ =gUnknown_08499594
	ldrb r1, [r1, #8]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, [r2]
	adds r4, r4, r0
	mov r0, sb
	subs r0, #1
	ldrb r2, [r4]
	mov r1, sp
	adds r1, #4
	str r1, [sp, #8]
	add r1, sp, #4
	str r1, [sp]
	adds r1, r7, #0
	movs r3, #4
	bl sub_0805BD40
	adds r5, r0, #0
	mov r0, sb
	adds r0, #1
	ldrb r2, [r4]
	add r1, sp, #4
	str r1, [sp]
	adds r1, r7, #0
	movs r3, #2
	bl sub_0805BD40
	mov r8, r0
	subs r1, r7, #1
	ldrb r2, [r4]
	add r0, sp, #4
	str r0, [sp]
	mov r0, sb
	movs r3, #1
	bl sub_0805BD40
	adds r6, r0, #0
	adds r1, r7, #1
	ldrb r2, [r4]
	add r0, sp, #4
	str r0, [sp]
	mov r0, sb
	movs r3, #3
	bl sub_0805BD40
	add r5, r8
	adds r5, r5, r6
	cmn r5, r0
	beq _0805BD2C
	ldr r4, _0805BD28 @ =0x0000270F
	mov r1, sl
	strh r4, [r1]
	add r0, sp, #4
	ldrh r0, [r0]
	ldr r2, [sp, #8]
	ldrh r1, [r2, #2]
	mov r2, sl
	bl sub_0805BF3C
	mov r1, sl
	ldrh r0, [r1]
	cmp r0, r4
	beq _0805BD2C
	movs r0, #1
	b _0805BD2E
	.align 2, 0
_0805BD20: .4byte gUnknown_030040D8
_0805BD24: .4byte gUnknown_08499594
_0805BD28: .4byte 0x0000270F
_0805BD2C:
	movs r0, #0
_0805BD2E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

