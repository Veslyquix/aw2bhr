	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013D7C
sub_08013D7C: @ 0x08013D7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	mov sl, r2
	adds r6, r3, #0
	ldr r0, [sp, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	movs r0, #0
	mov r8, r0
	lsls r0, r1, #5
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	b _08013FC2
_08013DAA:
	adds r6, r1, #0
	b _08013FC2
_08013DAE:
	ldrb r0, [r6]
	cmp r0, #0x43
	bne _08013E88
	ldrb r1, [r6, #1]
	cmp r1, #0x31
	bne _08013E20
	ldr r2, _08013DEC @ =gUnknown_08499594
	ldr r0, _08013DF0 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r4, r1, r0
	ldrb r1, [r4, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08013DF4
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	b _08013DF6
	.align 2, 0
_08013DEC: .4byte gUnknown_08499594
_08013DF0: .4byte gUnknown_030040D8
_08013DF4:
	movs r5, #0
_08013DF6:
	ldr r0, [sp, #0x10]
	add r0, r8
	lsls r0, r0, #1
	add r0, sl
	ldr r2, [sp, #0x14]
	lsls r1, r2, #6
	adds r0, r0, r1
	ldrb r1, [r4]
	ldr r2, _08013E1C @ =gUnknown_03003F2C
	ldrh r2, [r2]
	ldrb r3, [r4, #7]
	movs r4, #0
	str r4, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl sub_0802216C
	b _08013ECA
	.align 2, 0
_08013E1C: .4byte gUnknown_03003F2C
_08013E20:
	cmp r1, #0x32
	bne _08013E88
	ldr r2, _08013E54 @ =gUnknown_08499594
	ldr r0, _08013E58 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0, #8]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r4, r1, r0
	ldrb r1, [r4, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08013E5C
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	b _08013E5E
	.align 2, 0
_08013E54: .4byte gUnknown_08499594
_08013E58: .4byte gUnknown_030040D8
_08013E5C:
	movs r5, #0
_08013E5E:
	ldr r0, [sp, #0x10]
	add r0, r8
	lsls r0, r0, #1
	add r0, sl
	ldr r3, [sp, #0x14]
	lsls r1, r3, #6
	adds r0, r0, r1
	ldrb r1, [r4]
	ldr r2, _08013E84 @ =gUnknown_03003F2C
	ldrh r2, [r2]
	ldrb r3, [r4, #7]
	movs r4, #0
	str r4, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl sub_0802216C
	b _08013ECA
	.align 2, 0
_08013E84: .4byte gUnknown_03003F2C
_08013E88:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x4d
	bne _08013EE4
	mov r0, r8
	lsls r1, r0, #1
	mov r2, sb
	lsls r0, r2, #1
	add r0, sl
	adds r1, r1, r0
	ldrb r0, [r6, #1]
	lsls r0, r0, #2
	ldr r3, _08013ED8 @ =0xFFFFA0B0
	adds r0, r0, r3
	strh r0, [r1]
	ldrb r0, [r6, #1]
	lsls r0, r0, #2
	ldr r2, _08013EDC @ =0xFFFFA0B1
	adds r0, r0, r2
	strh r0, [r1, #2]
	adds r2, r1, #0
	adds r2, #0x40
	ldrb r0, [r6, #1]
	lsls r0, r0, #2
	adds r3, #2
	adds r0, r0, r3
	strh r0, [r2]
	adds r1, #0x42
	ldrb r0, [r6, #1]
	lsls r0, r0, #2
	ldr r2, _08013EE0 @ =0xFFFFA0B3
	adds r0, r0, r2
	strh r0, [r1]
_08013ECA:
	mov r0, r8
	adds r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r6, #2
	b _08013FC2
	.align 2, 0
_08013ED8: .4byte 0xFFFFA0B0
_08013EDC: .4byte 0xFFFFA0B1
_08013EE0: .4byte 0xFFFFA0B3
_08013EE4:
	ldrb r0, [r6, #1]
	ldrb r1, [r6]
	lsls r3, r1, #8
	orrs r3, r0
	lsls r7, r0, #8
	orrs r7, r1
	adds r6, #2
	ldr r0, _08013F18 @ =0xFFFF7EC0
	adds r1, r3, r0
	ldr r0, _08013F1C @ =0x0000FFF8
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #7
	ands r0, r3
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #8
	mov ip, r2
	ldr r0, _08013F20 @ =0x0000823F
	cmp r3, r0
	bhi _08013F28
	ldr r0, _08013F24 @ =gUnknown_0808F380
	ldr r0, [r0]
	b _08013F60
	.align 2, 0
_08013F18: .4byte 0xFFFF7EC0
_08013F1C: .4byte 0x0000FFF8
_08013F20: .4byte 0x0000823F
_08013F24: .4byte gUnknown_0808F380
_08013F28:
	ldr r0, _08013F44 @ =0xFFFFFE00
	adds r2, r0, #0
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08013F48 @ =0x0000833F
	cmp r3, r0
	bhi _08013F50
	ldr r0, _08013F4C @ =gUnknown_0808F380
	ldr r0, [r0, #4]
	mov r2, r8
	lsls r4, r2, #1
	b _08013F64
	.align 2, 0
_08013F44: .4byte 0xFFFFFE00
_08013F48: .4byte 0x0000833F
_08013F4C: .4byte gUnknown_0808F380
_08013F50:
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08013F70 @ =0x00008397
	cmp r3, r0
	bhi _08013F78
	ldr r0, _08013F74 @ =gUnknown_0808F380
	ldr r0, [r0, #8]
_08013F60:
	mov r3, r8
	lsls r4, r3, #1
_08013F64:
	mov r2, sb
	lsls r3, r2, #1
	mov r5, r8
	adds r5, #1
	b _08013F9C
	.align 2, 0
_08013F70: .4byte 0x00008397
_08013F74: .4byte gUnknown_0808F380
_08013F78:
	movs r3, #1
	mov ip, r3
	ldr r0, _08013FE8 @ =gUnknown_0808FC8C
	mov r1, r8
	lsls r4, r1, #1
	mov r2, sb
	lsls r3, r2, #1
	mov r5, r8
	adds r5, #1
	ldr r1, _08013FEC @ =gUnknown_0809091C
_08013F8C:
	ldrh r2, [r0]
	cmp r7, r2
	beq _08013F98
	adds r0, #6
	cmp r0, r1
	blo _08013F8C
_08013F98:
	adds r0, #2
	movs r1, #0
_08013F9C:
	add r3, sl
	adds r3, r4, r3
	lsls r2, r1, #1
	adds r2, r2, r0
	ldrh r1, [r2]
	ldr r0, [sp, #0x18]
	orrs r0, r1
	strh r0, [r3]
	adds r3, #0x40
	mov r1, ip
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	ldr r0, [sp, #0x18]
	orrs r0, r1
	strh r0, [r3]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_08013FC2:
	ldrb r0, [r6]
	cmp r0, #0
	beq _08013FD8
	cmp r0, #0xa
	beq _08013FCE
	b _08013DAE
_08013FCE:
	adds r1, r6, #1
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _08013FD8
	b _08013DAA
_08013FD8:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013FE8: .4byte gUnknown_0808FC8C
_08013FEC: .4byte gUnknown_0809091C

