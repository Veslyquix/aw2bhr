	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017720
sub_08017720: @ 0x08017720
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	bl sub_0803861C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801773C
	b _08017848
_0801773C:
	ldr r0, _080177DC @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #1
	beq _080177F0
	cmp r0, #2
	beq _0801774A
	b _08017848
_0801774A:
	subs r4, #0x6c
	movs r3, #0
	ldr r2, _080177E0 @ =gUnknown_0808E55C
	ldr r1, [r2]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrh r0, [r1, #2]
	lsrs r0, r0, #4
	mov ip, r2
	cmp r0, r5
	blt _08017786
_08017764:
	ldrh r0, [r1, #2]
	lsrs r0, r0, #4
	cmp r0, r5
	bne _08017776
	ldr r0, [r1]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x14
	cmp r0, r8
	bgt _08017786
_08017776:
	adds r1, #4
	adds r3, #1
	cmp r3, #4
	bgt _08017786
	ldrh r0, [r1, #2]
	lsrs r0, r0, #4
	cmp r0, r5
	bge _08017764
_08017786:
	cmp r3, #5
	beq _08017848
	movs r2, #3
	lsls r6, r4, #2
	lsls r7, r3, #2
	lsls r5, r5, #4
	cmp r2, r3
	blt _080177AE
	ldr r1, _080177E4 @ =gUnknown_0200C078
	adds r0, r6, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r1, r0, #0
	adds r1, #0xc
_080177A2:
	ldr r0, [r1]
	str r0, [r1, #4]
	subs r1, #4
	subs r2, #1
	cmp r2, r3
	bge _080177A2
_080177AE:
	mov r1, ip
	ldr r0, [r1]
	adds r1, r6, r4
	lsls r1, r1, #2
	adds r1, r7, r1
	adds r1, r1, r0
	mov r0, sb
	strb r0, [r1]
	ldrh r2, [r1, #2]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r5
	strh r0, [r1, #2]
	ldr r2, _080177E8 @ =0x00000FFF
	mov r0, r8
	ands r2, r0
	lsls r2, r2, #8
	ldr r0, [r1]
	ldr r3, _080177EC @ =0xFFF000FF
	ands r0, r3
	orrs r0, r2
	str r0, [r1]
	b _08017848
	.align 2, 0
_080177DC: .4byte gUnknown_03003FC0
_080177E0: .4byte gUnknown_0808E55C
_080177E4: .4byte gUnknown_0200C078
_080177E8: .4byte 0x00000FFF
_080177EC: .4byte 0xFFF000FF
_080177F0:
	subs r4, #0x8a
	ldr r6, _08017854 @ =gUnknown_0200C2D0
	bl sub_0803866C
	lsls r0, r0, #2
	lsls r4, r4, #3
	adds r0, r0, r4
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	lsrs r0, r0, #4
	cmp r0, r5
	bgt _08017848
	bl sub_0803866C
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r6
	mov r1, sb
	strb r1, [r0]
	bl sub_0803866C
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r6
	lsls r3, r5, #4
	ldrh r2, [r0, #2]
	movs r1, #0xf
	ands r1, r2
	orrs r1, r3
	strh r1, [r0, #2]
	bl sub_0803866C
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r6
	ldr r2, _08017858 @ =0x00000FFF
	mov r1, r8
	ands r2, r1
	lsls r2, r2, #8
	ldr r1, [r0]
	ldr r3, _0801785C @ =0xFFF000FF
	ands r1, r3
	orrs r1, r2
	str r1, [r0]
_08017848:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017854: .4byte gUnknown_0200C2D0
_08017858: .4byte 0x00000FFF
_0801785C: .4byte 0xFFF000FF

