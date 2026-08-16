	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032A00
sub_08032A00: @ 0x08032A00
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	add r1, sp, #8
	ldr r0, _08032AD8 @ =gUnknown_08090D48
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r7, _08032ADC @ =gUnknown_0849B060
	ldr r0, [r7]
	ldrb r0, [r0, #0xc]
	cmp r0, #1
	bls _08032A56
	ldr r0, _08032AE0 @ =gUnknown_0849B0C0
	mov r8, r0
	ldr r6, _08032AE4 @ =gUnknown_03004008
	ldr r0, [r6]
	lsrs r0, r0, #3
	movs r5, #3
	ands r0, r5
	add r0, r8
	ldrb r0, [r0]
	movs r1, #0x58
	subs r1, r1, r0
	movs r4, #0
	str r4, [sp]
	movs r0, #0x45
	movs r2, #0x4c
	movs r3, #0
	bl sub_0801F34C
	ldr r0, [r6]
	lsrs r0, r0, #3
	ands r0, r5
	add r0, r8
	ldrb r1, [r0]
	adds r1, #0xd8
	str r4, [sp]
	movs r0, #0x46
	movs r2, #0x4c
	movs r3, #0
	bl sub_0801F34C
_08032A56:
	ldr r0, [r7]
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _08032AB8
	ldr r4, _08032AE8 @ =gUnknown_08499578
	ldr r0, [r4]
	movs r1, #2
	str r1, [sp]
	movs r5, #0
	str r5, [sp, #4]
	movs r1, #0x11
	movs r2, #2
	movs r3, #0xc
	bl sub_08012BC8
	ldr r2, [r4]
	ldr r0, [r7]
	movs r1, #4
	ldrsh r0, [r0, r1]
	lsls r0, r0, #2
	add r0, sp
	adds r0, #8
	ldr r3, [r0]
	movs r6, #0x80
	lsls r6, r6, #8
	str r6, [sp]
	str r5, [sp, #4]
	movs r0, #0x11
	movs r1, #2
	bl sub_080149C0
	ldr r2, [r4]
	ldr r1, _08032AEC @ =gUnknown_02027C2C
	ldr r0, [r7]
	movs r3, #4
	ldrsh r0, [r0, r3]
	lsls r3, r0, #2
	adds r3, r3, r0
	lsls r3, r3, #2
	subs r3, r3, r0
	adds r3, r3, r1
	str r6, [sp]
	str r5, [sp, #4]
	movs r0, #0x13
	movs r1, #2
	bl sub_080149C0
	bl sub_08013AEC
_08032AB8:
	ldr r1, _08032AF0 @ =gUnknown_03002F18
	ldr r4, _08032AF4 @ =0x0000FFD4
	adds r0, r4, #0
	strh r0, [r1]
	ldr r1, _08032AF8 @ =gUnknown_03002B34
	ldr r0, [r7]
	ldrh r0, [r0, #0xe]
	subs r0, #0x60
	strh r0, [r1]
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032AD8: .4byte gUnknown_08090D48
_08032ADC: .4byte gUnknown_0849B060
_08032AE0: .4byte gUnknown_0849B0C0
_08032AE4: .4byte gUnknown_03004008
_08032AE8: .4byte gUnknown_08499578
_08032AEC: .4byte gUnknown_02027C2C
_08032AF0: .4byte gUnknown_03002F18
_08032AF4: .4byte 0x0000FFD4
_08032AF8: .4byte gUnknown_03002B34

