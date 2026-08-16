	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005080
sub_08005080: @ 0x08005080
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	movs r0, #0
	movs r1, #0
	bl sub_0800CB30
	mov sb, r0
	ldr r0, _080050D4 @ =gUnknown_0808D7B0
	mov r8, r0
	ldr r6, [r0]
	ldr r4, [r6]
	ldrb r5, [r4, #0x10]
	adds r4, #0x9c
	bl sub_0800C9E8
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0803CF54
	movs r0, #1
	mov r1, sb
	bl sub_0800CB30
	movs r4, #7
	ldr r0, [r6]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r7, r8
	cmp r0, #1
	beq _080050D8
	cmp r0, #1
	ble _080050DE
	cmp r0, #2
	beq _080050DC
	b _080050DE
	.align 2, 0
_080050D4: .4byte gUnknown_0808D7B0
_080050D8:
	movs r4, #9
	b _080050DE
_080050DC:
	movs r4, #0xb
_080050DE:
	ldr r5, _08005148 @ =gUnknown_08499578
	ldr r0, [r5]
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	movs r1, #2
	str r1, [sp]
	movs r6, #0
	str r6, [sp, #4]
	movs r1, #5
	movs r3, #9
	bl sub_08012BC8
	asrs r4, r4, #0x10
	ldr r2, [r5]
	ldr r5, [r7]
	ldr r3, [r5]
	adds r3, #0x9c
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	str r6, [sp, #4]
	movs r0, #5
	adds r1, r4, #0
	bl sub_080149C0
	bl sub_08013AEC
	ldr r2, [r5]
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08005130
	ldr r0, _0800514C @ =0x0000FEFF
	ands r0, r1
	movs r1, #0
	strh r0, [r2]
	adds r0, r2, #0
	adds r0, #0x9c
	strb r1, [r0]
_08005130:
	ldr r2, [r5]
	ldrh r1, [r2]
	ldr r0, _08005150 @ =0x0000EFFF
	ands r0, r1
	strh r0, [r2]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005148: .4byte gUnknown_08499578
_0800514C: .4byte 0x0000FEFF
_08005150: .4byte 0x0000EFFF

