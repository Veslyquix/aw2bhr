	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08046778
sub_08046778: @ 0x08046778
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	movs r0, #0
	str r0, [sp, #0xc]
	mov sb, r0
	ldr r5, _080467CC @ =gUnknown_03003FC0
_08046798:
	adds r3, r5, #0
	adds r3, #0x2c
	ldr r0, _080467D0 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _080467D4 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r2
	ldrb r1, [r4, #0x1e]
	lsls r0, r1, #4
	adds r0, r0, r1
	ldrb r3, [r3]
	adds r0, r0, r3
	lsls r2, r0, #2
	ldrb r0, [r5, #8]
	cmp r0, #0
	beq _080467D8
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #6
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r2, r0
	b _080467DE
	.align 2, 0
_080467CC: .4byte gUnknown_03003FC0
_080467D0: .4byte gUnknown_030033EC
_080467D4: .4byte gUnknown_08499598
_080467D8:
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r2, r1
_080467DE:
	ldr r3, _08046854 @ =gUnknown_085D3E20
	adds r0, r3, r0
	ldr r1, [r0]
	ldr r0, _08046858 @ =gUnknown_084C212A
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #5
	add r0, sl
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080468AC
	ldr r2, _0804685C @ =gUnknown_084C211C
	ldr r0, [sp, #0xc]
	lsls r1, r0, #1
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r3, [sp, #8]
	adds r0, r3, r0
	lsrs r0, r0, #3
	mov ip, r0
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r7, [r0]
	ldr r0, _08046860 @ =gUnknown_08499578
	ldr r6, [r0]
	ldr r0, _08046864 @ =gUnknown_085D3DD0
	mov r8, r0
	adds r3, r5, #0
	adds r3, #0x2c
	ldr r0, _08046868 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _0804686C @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r2
	ldrb r1, [r4, #0x1e]
	lsls r0, r1, #4
	adds r0, r0, r1
	ldrb r3, [r3]
	adds r0, r0, r3
	lsls r2, r0, #2
	ldrb r0, [r5, #8]
	cmp r0, #0
	beq _08046870
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #6
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, r0
	b _08046876
	.align 2, 0
_08046854: .4byte gUnknown_085D3E20
_08046858: .4byte gUnknown_084C212A
_0804685C: .4byte gUnknown_084C211C
_08046860: .4byte gUnknown_08499578
_08046864: .4byte gUnknown_085D3DD0
_08046868: .4byte gUnknown_030033EC
_0804686C: .4byte gUnknown_08499598
_08046870:
	movs r3, #0x82
	lsls r3, r3, #1
	adds r1, r2, r3
_08046876:
	mov r0, r8
	adds r0, #0x50
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _080468D0 @ =gUnknown_084C212A
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #5
	add r0, sl
	adds r1, r1, r0
	movs r3, #0
	ldrsb r3, [r1, r3]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	mov r0, ip
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_08014B0C
	ldr r0, [sp, #0xc]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
_080468AC:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r0, #6
	bhi _080468BC
	b _08046798
_080468BC:
	bl sub_08013AEC
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080468D0: .4byte gUnknown_084C212A

