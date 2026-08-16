	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804A1E4
sub_0804A1E4: @ 0x0804A1E4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0xb0
	bl sub_0801B768
	ldr r5, _0804A258 @ =gUnknown_08499578
	ldr r0, [r5]
	ldr r6, _0804A25C @ =gUnknown_030044E0
	ldr r2, [r6]
	adds r1, r2, #0
	adds r1, #0x61
	ldrb r1, [r1]
	adds r2, #0x5e
	ldrb r3, [r2]
	adds r3, #1
	movs r2, #2
	str r2, [sp]
	movs r4, #0
	str r4, [sp, #4]
	bl sub_08012BC8
	ldr r3, [r6]
	adds r0, r3, #0
	adds r0, #0x61
	ldrb r0, [r0]
	ldr r2, [r5]
	adds r3, #0x2c
	movs r1, #0x80
	lsls r1, r1, #8
	str r1, [sp]
	str r4, [sp, #4]
	movs r1, #2
	bl sub_080149C0
	ldr r0, [r6]
	adds r0, #0x2c
	bl sub_08014CEC
	ldr r1, [r6]
	adds r1, #0x65
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804A24A
	ldr r1, [r6]
	adds r1, #0x65
	ldrb r0, [r1]
	subs r0, r0, r7
	strb r0, [r1]
_0804A24A:
	bl sub_08013AEC
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A258: .4byte gUnknown_08499578
_0804A25C: .4byte gUnknown_030044E0

