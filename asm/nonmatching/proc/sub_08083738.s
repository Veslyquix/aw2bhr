	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08083738
sub_08083738: @ 0x08083738
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08083780 @ =gUnknown_081D93CC
	ldr r7, [r4]
	adds r5, r6, #0
	adds r5, #0x52
	ldrh r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r7
	ldrb r0, [r0]
	mov r8, r4
	cmp r0, #0
	bne _080837B0
	bl sub_0803BC7C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808378C
	ldr r4, _08083784 @ =gUnknown_081D93D0
	ldr r3, [r4]
	ldr r0, _08083788 @ =0x0000AA98
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	movs r2, #0x48
	bl sub_0801BEBC
	b _0808379E
	.align 2, 0
_08083780: .4byte gUnknown_081D93CC
_08083784: .4byte gUnknown_081D93D0
_08083788: .4byte 0x0000AA98
_0808378C:
	ldr r4, _080837A4 @ =gUnknown_081D93D0
	ldr r3, [r4]
	ldr r0, _080837A8 @ =0x00002A98
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	movs r2, #0x48
	bl sub_0801BEBC
_0808379E:
	ldr r3, [r4]
	ldr r0, _080837AC @ =0x00002AA4
	b _0808385A
	.align 2, 0
_080837A4: .4byte gUnknown_081D93D0
_080837A8: .4byte 0x00002A98
_080837AC: .4byte 0x00002AA4
_080837B0:
	ldrh r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808380C
	bl sub_0803BC88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080837E8
	ldr r4, _080837E0 @ =gUnknown_081D93D0
	ldr r3, [r4]
	ldr r0, _080837E4 @ =0x0000BA98
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	movs r2, #0x48
	bl sub_0801BEBC
	b _080837FA
	.align 2, 0
_080837E0: .4byte gUnknown_081D93D0
_080837E4: .4byte 0x0000BA98
_080837E8:
	ldr r4, _08083800 @ =gUnknown_081D93D0
	ldr r3, [r4]
	ldr r0, _08083804 @ =0x00003A98
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	movs r2, #0x48
	bl sub_0801BEBC
_080837FA:
	ldr r3, [r4]
	ldr r0, _08083808 @ =0x00003AA4
	b _0808385A
	.align 2, 0
_08083800: .4byte gUnknown_081D93D0
_08083804: .4byte 0x00003A98
_08083808: .4byte 0x00003AA4
_0808380C:
	ldrh r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #5
	bne _08083874
	bl sub_0803BC94
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08083844
	ldr r4, _0808383C @ =gUnknown_081D93D0
	ldr r3, [r4]
	ldr r0, _08083840 @ =0x0000CA98
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	movs r2, #0x48
	bl sub_0801BEBC
	b _08083856
	.align 2, 0
_0808383C: .4byte gUnknown_081D93D0
_08083840: .4byte 0x0000CA98
_08083844:
	ldr r4, _08083868 @ =gUnknown_081D93D0
	ldr r3, [r4]
	ldr r0, _0808386C @ =0x00007A98
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	movs r2, #0x48
	bl sub_0801BEBC
_08083856:
	ldr r3, [r4]
	ldr r0, _08083870 @ =0x00007AA4
_0808385A:
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	movs r2, #0x58
	bl sub_0801BEBC
	b _080838A8
	.align 2, 0
_08083868: .4byte gUnknown_081D93D0
_0808386C: .4byte 0x00007A98
_08083870: .4byte 0x00007AA4
_08083874:
	ldrh r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #3
	bne _080838A8
	ldr r4, _080838CC @ =gUnknown_08615C04
	ldr r0, _080838D0 @ =0x00005AB0
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	movs r2, #0x48
	adds r3, r4, #0
	bl sub_0801BEBC
	ldr r0, _080838D4 @ =0x00005ABC
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	movs r2, #0x58
	adds r3, r4, #0
	bl sub_0801BEBC
_080838A8:
	ldr r0, [r6, #0x60]
	cmp r0, #0
	beq _08083980
	ldr r0, _080838D8 @ =gUnknown_03005968
	ldr r0, [r0]
	cmp r0, #0
	beq _080838DC
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #4
	str r0, [sp]
	movs r1, #0x10
	b _080838F0
	.align 2, 0
_080838CC: .4byte gUnknown_08615C04
_080838D0: .4byte 0x00005AB0
_080838D4: .4byte 0x00005ABC
_080838D8: .4byte gUnknown_03005968
_080838DC:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r3, [r0, r2]
	movs r0, #4
	str r0, [sp]
	movs r0, #1
	movs r2, #0x10
_080838F0:
	bl sub_08074234
	str r0, [r6, #0x34]
	ldr r4, _0808396C @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r5, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	adds r0, r5, #0
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	movs r0, #0
	ldrsh r4, [r4, r0]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	ldr r1, [r6, #0x34]
	cmp r1, #0
	bne _08083926
	movs r1, #2
_08083926:
	bl Div
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	lsls r0, r4, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r1, [r6, #0x34]
	cmp r1, #0
	bne _08083942
	movs r1, #2
_08083942:
	adds r0, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	mov r1, sb
	adds r2, r7, #0
	adds r3, r4, #0
	bl sub_0801E108
	ldr r1, _08083970 @ =0x0000025B
	ldr r2, _08083974 @ =0x00000153
	ldr r3, _08083978 @ =gUnknown_0848B6CE
	ldr r0, _0808397C @ =0x0000D2C8
	str r0, [sp]
	movs r0, #1
	bl sub_0801BEFC
	b _08083A1C
	.align 2, 0
_0808396C: .4byte gUnknown_0808F100
_08083970: .4byte 0x0000025B
_08083974: .4byte 0x00000153
_08083978: .4byte gUnknown_0848B6CE
_0808397C: .4byte 0x0000D2C8
_08083980:
	ldr r0, _08083A2C @ =gUnknown_03005968
	ldr r0, [r0]
	cmp r0, #0
	beq _08083A1C
	movs r0, #0x20
	bl sub_0803CBD8
	cmp r0, #0
	beq _08083A1C
	mov r1, r8
	ldr r4, [r1]
	adds r0, r6, #0
	adds r0, #0x52
	ldrh r0, [r0]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08083A1C
	ldr r4, _08083A30 @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r2, [r0, r1]
	lsls r2, r2, #4
	mov sb, r2
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r0, sb
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r0, #0
	ldrsh r4, [r4, r0]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
	ldr r1, _08083A34 @ =0x0000025B
	ldr r2, _08083A38 @ =0x00000153
	ldr r3, _08083A3C @ =gUnknown_0848B6CE
	ldr r0, _08083A40 @ =0x0000D2C8
	str r0, [sp]
	movs r0, #1
	bl sub_0801BEFC
_08083A1C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083A2C: .4byte gUnknown_03005968
_08083A30: .4byte gUnknown_0808F100
_08083A34: .4byte 0x0000025B
_08083A38: .4byte 0x00000153
_08083A3C: .4byte gUnknown_0848B6CE
_08083A40: .4byte 0x0000D2C8

