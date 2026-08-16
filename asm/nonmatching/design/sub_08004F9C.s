	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004F9C
sub_08004F9C: @ 0x08004F9C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	movs r0, #0
	movs r1, #0
	bl sub_0800CB30
	mov sb, r0
	ldr r0, _08004FF0 @ =gUnknown_0808D7AC
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
	movs r7, #7
	ldr r0, [r6]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08004FF4
	cmp r0, #1
	ble _08004FFA
	cmp r0, #2
	beq _08004FF8
	b _08004FFA
	.align 2, 0
_08004FF0: .4byte gUnknown_0808D7AC
_08004FF4:
	movs r7, #9
	b _08004FFA
_08004FF8:
	movs r7, #0xb
_08004FFA:
	ldr r4, _08005074 @ =gUnknown_08499578
	ldr r0, [r4]
	lsls r5, r7, #0x10
	lsrs r2, r5, #0x10
	movs r1, #2
	str r1, [sp]
	movs r6, #0
	str r6, [sp, #4]
	movs r1, #3
	movs r3, #0xb
	bl sub_08012BC8
	lsls r0, r7, #6
	adds r0, #6
	ldr r1, [r4]
	adds r1, r1, r0
	movs r0, #9
	bl sub_0801F2AC
	asrs r5, r5, #0x10
	ldr r2, [r4]
	mov r0, r8
	ldr r4, [r0]
	ldr r3, [r4]
	adds r3, #0x9c
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	str r6, [sp, #4]
	movs r0, #5
	adds r1, r5, #0
	bl sub_080149C0
	bl sub_08013AEC
	ldr r2, [r4]
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800505C
	ldr r0, _08005078 @ =0x0000FEFF
	ands r0, r1
	movs r1, #0
	strh r0, [r2]
	adds r0, r2, #0
	adds r0, #0x9c
	strb r1, [r0]
_0800505C:
	ldr r2, [r4]
	ldrh r1, [r2]
	ldr r0, _0800507C @ =0x0000EFFF
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
_08005074: .4byte gUnknown_08499578
_08005078: .4byte 0x0000FEFF
_0800507C: .4byte 0x0000EFFF

