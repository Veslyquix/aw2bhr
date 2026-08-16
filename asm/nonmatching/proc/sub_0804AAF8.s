	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804AAF8
sub_0804AAF8: @ 0x0804AAF8
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r0, _0804AB28 @ =gUnknown_0812A28C
	ldr r1, [r0]
	ldr r3, [r1]
	adds r2, r3, #0
	adds r2, #0x66
	ldrb r4, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r6, r0, #0
	cmp r1, #0
	bge _0804ABC4
	adds r0, r3, #0
	adds r0, #0x67
	ldrb r0, [r0]
	cmp r0, #4
	bgt _0804AB2C
	cmp r0, #1
	bge _0804AB38
	cmp r0, #0
	beq _0804AB32
	b _0804ABAA
	.align 2, 0
_0804AB28: .4byte gUnknown_0812A28C
_0804AB2C:
	cmp r0, #5
	beq _0804AB80
	b _0804ABAA
_0804AB32:
	movs r0, #0
	bl sub_0801B768
_0804AB38:
	ldr r0, [r6]
	ldr r3, [r0]
	adds r0, r3, #0
	adds r0, #0x67
	ldrb r4, [r0]
	lsls r1, r4, #0x11
	movs r0, #0xc0
	lsls r0, r0, #0xb
	adds r1, r1, r0
	asrs r1, r1, #0x10
	ldr r0, _0804AB78 @ =gUnknown_08499578
	ldr r2, [r0]
	ldr r5, _0804AB7C @ =gUnknown_084C3B3C
	adds r3, #0x66
	ldrb r0, [r3]
	movs r3, #1
	ands r3, r0
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, r4, r5
	ldr r3, [r4]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #6
	bl sub_080149C0
	b _0804ABAA
	.align 2, 0
_0804AB78: .4byte gUnknown_08499578
_0804AB7C: .4byte gUnknown_084C3B3C
_0804AB80:
	movs r0, #1
	ands r0, r4
	strb r0, [r2]
	cmp r0, #0
	beq _0804AB9C
	ldr r0, _0804AB94 @ =gUnknown_0813593C
	ldr r1, _0804AB98 @ =0x060103E0
	bl sub_08011CAC
	b _0804ABA4
	.align 2, 0
_0804AB94: .4byte gUnknown_0813593C
_0804AB98: .4byte 0x060103E0
_0804AB9C:
	ldr r0, _0804ABBC @ =gUnknown_081358A0
	ldr r1, _0804ABC0 @ =0x060103E0
	bl sub_08011CAC
_0804ABA4:
	movs r0, #0xb0
	bl sub_0801B768
_0804ABAA:
	ldr r0, [r6]
	ldr r1, [r0]
	adds r1, #0x67
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bl sub_08013AEC
	b _0804ABD2
	.align 2, 0
_0804ABBC: .4byte gUnknown_081358A0
_0804ABC0: .4byte 0x060103E0
_0804ABC4:
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804ABD2
	bl sub_0804A760
_0804ABD2:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

