	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080824D4
sub_080824D4: @ 0x080824D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x4e
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08082510
	adds r0, r6, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r0, [sp, #4]
	cmp r1, #0
	bne _0808251E
	adds r0, #4
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _08082510
	adds r0, r6, #0
	bl sub_08082660
	mov r8, r4
	b _080825DC
_08082510:
	adds r0, r6, #0
	adds r0, #0x64
	movs r5, #0
	ldrsh r1, [r0, r5]
	str r0, [sp, #4]
	cmp r1, #0
	beq _0808252C
_0808251E:
	adds r0, r6, #0
	bl sub_08083A44
	movs r7, #0x4e
	adds r7, r7, r6
	mov r8, r7
	b _080825DC
_0808252C:
	movs r5, #0
	movs r0, #0x4e
	adds r0, r0, r6
	mov r8, r0
	ldr r1, _08082568 @ =gUnknown_081D93B0
	mov sl, r1
	ldr r2, _0808256C @ =gUnknown_08616972
	mov sb, r2
	adds r7, r6, #0
	adds r7, #0x52
_08082540:
	cmp r5, #2
	bne _0808257C
	mov r3, sb
	ldrh r0, [r3, #6]
	ldr r5, _08082570 @ =0x000001FF
	adds r1, r5, #0
	ands r1, r0
	mov r2, sl
	ldr r0, [r2]
	movs r3, #6
	ldrsh r2, [r0, r3]
	subs r2, #8
	ldr r0, _08082574 @ =0x00008998
	str r0, [sp]
	movs r0, #2
	ldr r3, _08082578 @ =gUnknown_08615C76
	bl sub_0801BEBC
	movs r4, #3
	b _080825D0
	.align 2, 0
_08082568: .4byte gUnknown_081D93B0
_0808256C: .4byte gUnknown_08616972
_08082570: .4byte 0x000001FF
_08082574: .4byte 0x00008998
_08082578: .4byte gUnknown_08615C76
_0808257C:
	ldrh r0, [r7]
	adds r0, r0, r5
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	ldrh r0, [r7]
	adds r0, r0, r5
	movs r1, #6
	bl DivRem
	ldr r1, _08082654 @ =gUnknown_0861696C
	adds r4, r4, r1
	ldrb r3, [r4]
	adds r3, #2
	lsls r3, r3, #0xc
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r1, #0xec
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	orrs r3, r0
	adds r4, r5, #1
	lsls r2, r4, #1
	mov r5, sb
	adds r0, r2, r5
	movs r5, #0
	ldrsh r1, [r0, r5]
	mov r5, sl
	ldr r0, [r5]
	adds r2, r2, r0
	movs r0, #0
	ldrsh r2, [r2, r0]
	str r3, [sp]
	movs r0, #2
	ldr r3, _08082658 @ =gUnknown_08615C84
	bl sub_0801BEBC
_080825D0:
	adds r5, r4, #0
	cmp r5, #4
	ble _08082540
	adds r0, r6, #0
	bl sub_08083738
_080825DC:
	movs r2, #0xc0
	lsls r2, r2, #5
	movs r0, #1
	str r0, [sp]
	movs r0, #0xb0
	movs r1, #0xa0
	movs r3, #4
	bl sub_08043C28
	adds r0, r6, #0
	bl sub_08083EE0
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08082644
	ldr r0, _0808265C @ =gUnknown_081D93B4
	ldr r3, [r0]
	adds r1, r6, #0
	adds r1, #0x52
	ldrb r2, [r3]
	adds r4, r1, #0
	mov r8, r0
	adds r5, r6, #0
	adds r5, #0x66
	ldrh r7, [r4]
	cmp r2, r7
	bne _0808262C
	ldrb r1, [r3, #1]
	ldr r2, [sp, #4]
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bne _0808262C
	ldrb r1, [r3, #2]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	beq _08082644
_0808262C:
	mov r3, r8
	ldr r1, [r3]
	ldrh r0, [r4]
	strb r0, [r1]
	ldr r7, [sp, #4]
	ldrh r0, [r7]
	strb r0, [r1, #1]
	ldrh r0, [r5]
	strb r0, [r1, #2]
	adds r0, r6, #0
	bl sub_08084600
_08082644:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082654: .4byte gUnknown_0861696C
_08082658: .4byte gUnknown_08615C84
_0808265C: .4byte gUnknown_081D93B4

