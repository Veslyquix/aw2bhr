	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080196F4
sub_080196F4: @ 0x080196F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r0, _08019734 @ =gUnknown_0808E5AC
	ldr r1, [r0]
	ldrh r1, [r1]
	mov sl, r1
	ldrb r2, [r5]
	adds r1, r2, #0
	mov r8, r0
	ldr r0, _08019738 @ =gUnknown_0808E5B0
	mov sb, r0
	cmp r1, #0xff
	beq _080197EA
	movs r7, #0x80
	rsbs r7, r7, #0
_0801971A:
	cmp r2, #0xfe
	bne _0801973C
	mov r2, r8
	ldr r1, [r2]
	ldrb r0, [r5, #1]
	strh r0, [r1]
	mov r3, sb
	ldr r2, [r3]
	ldrh r0, [r1]
	subs r0, #1
	lsls r0, r0, #6
	strh r0, [r2]
	b _080197E0
	.align 2, 0
_08019734: .4byte gUnknown_0808E5AC
_08019738: .4byte gUnknown_0808E5B0
_0801973C:
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	ldrb r2, [r5, #2]
	bl sub_08025C5C
	adds r4, r0, #0
	cmp r4, #0
	beq _080197EA
	movs r0, #0x7f
	ldrb r1, [r5, #4]
	ands r1, r0
	ldrb r2, [r4, #4]
	adds r0, r7, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #4]
	ldrb r0, [r5, #6]
	movs r1, #0x7f
	ands r1, r0
	ldrb r2, [r4, #6]
	adds r0, r7, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #6]
	ldrb r0, [r5, #5]
	cmp r0, #0x63
	bne _0801977E
	ldrh r0, [r4, #4]
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	b _08019790
_0801977E:
	ldrb r2, [r5, #5]
	movs r0, #0xf
	ands r2, r0
	lsls r2, r2, #7
	ldrh r0, [r4, #4]
	ldr r3, _08019810 @ =0xFFFFF87F
	adds r1, r3, #0
	ands r0, r1
	orrs r0, r2
_08019790:
	strh r0, [r4, #4]
	ldrb r0, [r5, #3]
	strb r0, [r4, #1]
	movs r0, #0
	strb r0, [r4, #9]
	strb r0, [r4, #0xa]
	ldrb r0, [r5, #9]
	strb r0, [r4, #0xb]
	ldrb r6, [r4, #6]
	lsls r2, r6, #0x19
	ldr r3, _08019814 @ =gUnknown_085D5ABC
	ldrb r1, [r4]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r3, r0, r3
	ldrb r0, [r3, #0x10]
	lsrs r2, r2, #0x19
	cmp r2, r0
	bls _080197C4
	movs r1, #0x7f
	ands r1, r0
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r6
	orrs r0, r1
	strb r0, [r4, #6]
_080197C4:
	ldrh r2, [r4, #4]
	lsls r0, r2, #0x15
	ldrb r1, [r3, #0xb]
	lsrs r0, r0, #0x1c
	cmp r0, r1
	bls _080197E0
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #7
	ldr r3, _08019810 @ =0xFFFFF87F
	adds r0, r3, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
_080197E0:
	adds r5, #0xc
	ldrb r2, [r5]
	adds r0, r2, #0
	cmp r0, #0xff
	bne _0801971A
_080197EA:
	bl sub_080258CC
	mov r1, r8
	ldr r0, [r1]
	mov r2, sl
	strh r2, [r0]
	mov r3, sb
	ldr r1, [r3]
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #6
	strh r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019810: .4byte 0xFFFFF87F
_08019814: .4byte gUnknown_085D5ABC

