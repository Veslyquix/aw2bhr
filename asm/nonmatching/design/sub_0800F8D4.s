	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800F8D4
sub_0800F8D4: @ 0x0800F8D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r3, _0800FA04 @ =gUnknown_0808D898
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r4, #1
	ldr r6, _0800FA08 @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r2, _0800FA0C @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r6, _0800FA10 @ =0xFFFFFEBE
	adds r0, r1, r6
	mov ip, r3
	cmp r0, #1
	bls _0800F950
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	beq _0800F950
	adds r0, #1
	cmp r1, r0
	beq _0800F950
	adds r0, #0x1f
	cmp r1, r0
	beq _0800F950
	adds r0, #1
	cmp r1, r0
	beq _0800F950
	adds r0, #1
	cmp r1, r0
	beq _0800F950
	adds r0, #1
	cmp r1, r0
	beq _0800F950
	subs r0, #0x41
	cmp r1, r0
	beq _0800F950
	adds r0, #1
	cmp r1, r0
	beq _0800F950
	subs r0, #2
	cmp r1, r0
	beq _0800F950
	subs r0, #1
	cmp r1, r0
	beq _0800F950
	subs r0, #0x1d
	cmp r1, r0
	beq _0800F950
	subs r0, #1
	cmp r1, r0
	beq _0800F950
	b _0800FD38
_0800F950:
	movs r6, #0xa1
	lsls r6, r6, #1
	cmp r1, r6
	beq _0800F962
	movs r0, #0xb1
	lsls r0, r0, #1
	mov r8, r0
	cmp r1, r8
	bne _0800FA1C
_0800F962:
	subs r0, r5, #1
	cmp r0, #0
	bge _0800F96A
	b _0800FD38
_0800F96A:
	adds r1, r5, #1
	mov r2, ip
	ldr r0, [r2]
	ldr r3, [r0]
	ldrh r0, [r3]
	cmp r1, r0
	blt _0800F97A
	b _0800FD38
_0800F97A:
	lsls r2, r4, #1
	ldr r1, _0800FA08 @ =0x0000417A
	adds r0, r3, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r4, _0800FA0C @ =0x00000A22
	adds r1, r3, r4
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, r6
	beq _0800F9BE
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	beq _0800F9BE
	adds r0, #0x20
	cmp r1, r0
	beq _0800F9BE
	adds r0, #2
	cmp r1, r0
	beq _0800F9BE
	subs r0, #0x40
	cmp r1, r0
	beq _0800F9BE
	subs r0, #1
	cmp r1, r0
	beq _0800F9BE
	subs r0, #1
	cmp r1, r0
	beq _0800F9BE
	b _0800FD38
_0800F9BE:
	mov r6, ip
	ldr r0, [r6]
	ldr r1, [r0]
	ldr r3, _0800FA08 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r4, _0800FA0C @ =0x00000A22
	adds r1, r1, r4
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r6, _0800FA14 @ =0xFFFFFEBF
	adds r0, r1, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0800F9E8
	b _0800FD24
_0800F9E8:
	ldr r0, _0800FA18 @ =0x00000161
	cmp r1, r0
	bne _0800F9F0
	b _0800FD24
_0800F9F0:
	adds r0, #1
	cmp r1, r0
	bne _0800F9F8
	b _0800FD24
_0800F9F8:
	subs r0, #0x40
	cmp r1, r0
	bne _0800FA00
	b _0800FD24
_0800FA00:
	subs r0, #1
	b _0800FD1A
	.align 2, 0
_0800FA04: .4byte gUnknown_0808D898
_0800FA08: .4byte 0x0000417A
_0800FA0C: .4byte 0x00000A22
_0800FA10: .4byte 0xFFFFFEBE
_0800FA14: .4byte 0xFFFFFEBF
_0800FA18: .4byte 0x00000161
_0800FA1C:
	ldr r7, _0800FA9C @ =0x00000143
	cmp r1, r7
	beq _0800FA28
	ldr r0, _0800FAA0 @ =0x00000163
	cmp r1, r0
	bne _0800FAAC
_0800FA28:
	subs r1, r4, #1
	cmp r1, #0
	bge _0800FA30
	b _0800FD38
_0800FA30:
	mov r2, ip
	ldr r0, [r2]
	ldr r2, [r0]
	adds r3, r4, #1
	ldrh r4, [r2, #2]
	cmp r3, r4
	blt _0800FA40
	b _0800FD38
_0800FA40:
	lsls r1, r1, #1
	ldr r6, _0800FAA4 @ =0x0000417A
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, r1, r5
	lsls r1, r1, #1
	ldr r4, _0800FAA8 @ =0x00000A22
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, r7
	beq _0800FA82
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	beq _0800FA82
	adds r0, #1
	cmp r1, r0
	beq _0800FA82
	adds r0, #0x22
	cmp r1, r0
	beq _0800FA82
	subs r0, #0x40
	cmp r1, r0
	beq _0800FA82
	subs r0, #0x20
	cmp r1, r0
	beq _0800FA82
	subs r0, #1
	cmp r1, r0
	beq _0800FA82
	b _0800FD38
_0800FA82:
	mov r6, ip
	ldr r0, [r6]
	ldr r1, [r0]
	lsls r2, r3, #1
	ldr r3, _0800FAA4 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r4, _0800FAA8 @ =0x00000A22
	adds r1, r1, r4
	b _0800FCF6
	.align 2, 0
_0800FA9C: .4byte 0x00000143
_0800FAA0: .4byte 0x00000163
_0800FAA4: .4byte 0x0000417A
_0800FAA8: .4byte 0x00000A22
_0800FAAC:
	ldr r7, _0800FB44 @ =0x00000161
	cmp r1, r7
	bne _0800FB54
	subs r0, r5, #1
	cmp r0, #0
	bge _0800FABA
	b _0800FD38
_0800FABA:
	subs r3, r4, #1
	cmp r3, #0
	bge _0800FAC2
	b _0800FD38
_0800FAC2:
	mov r1, ip
	ldr r0, [r1]
	ldr r1, [r0]
	lsls r2, r4, #1
	ldr r4, _0800FB48 @ =0x0000417A
	adds r0, r1, r4
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r2, _0800FB4C @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, r6
	beq _0800FB0A
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	beq _0800FB0A
	adds r0, #0x20
	cmp r1, r0
	beq _0800FB0A
	cmp r1, r8
	beq _0800FB0A
	subs r0, #0x3e
	cmp r1, r0
	beq _0800FB0A
	subs r0, #1
	cmp r1, r0
	beq _0800FB0A
	subs r0, #1
	cmp r1, r0
	beq _0800FB0A
	b _0800FD38
_0800FB0A:
	mov r4, ip
	ldr r0, [r4]
	ldr r1, [r0]
	lsls r2, r3, #1
	ldr r6, _0800FB48 @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r2, _0800FB4C @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r0, _0800FB50 @ =0x00000143
	cmp r1, r0
	bne _0800FB2E
	b _0800FD24
_0800FB2E:
	subs r0, #3
	cmp r1, r0
	bne _0800FB36
	b _0800FD24
_0800FB36:
	adds r0, #1
	cmp r1, r0
	bne _0800FB3E
	b _0800FD24
_0800FB3E:
	adds r0, #0x22
	b _0800FD0E
	.align 2, 0
_0800FB44: .4byte 0x00000161
_0800FB48: .4byte 0x0000417A
_0800FB4C: .4byte 0x00000A22
_0800FB50: .4byte 0x00000143
_0800FB54:
	ldr r0, _0800FBD0 @ =0x00000141
	cmp r1, r0
	bne _0800FBDC
	subs r0, r5, #1
	cmp r0, #0
	bge _0800FB62
	b _0800FD38
_0800FB62:
	mov r3, ip
	ldr r0, [r3]
	ldr r2, [r0]
	adds r3, r4, #1
	ldrh r0, [r2, #2]
	cmp r3, r0
	blt _0800FB72
	b _0800FD38
_0800FB72:
	lsls r1, r4, #1
	ldr r4, _0800FBD4 @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r4, _0800FBD8 @ =0x00000A22
	adds r1, r2, r4
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, r6
	beq _0800FBB4
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	beq _0800FBB4
	adds r0, #0x20
	cmp r1, r0
	beq _0800FBB4
	cmp r1, r8
	beq _0800FBB4
	subs r0, #0x3e
	cmp r1, r0
	beq _0800FBB4
	subs r0, #1
	cmp r1, r0
	beq _0800FBB4
	subs r0, #1
	cmp r1, r0
	beq _0800FBB4
	b _0800FD38
_0800FBB4:
	mov r6, ip
	ldr r0, [r6]
	ldr r1, [r0]
	lsls r2, r3, #1
	ldr r3, _0800FBD4 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r4, _0800FBD8 @ =0x00000A22
	adds r1, r1, r4
	b _0800FCF6
	.align 2, 0
_0800FBD0: .4byte 0x00000141
_0800FBD4: .4byte 0x0000417A
_0800FBD8: .4byte 0x00000A22
_0800FBDC:
	movs r0, #0xb0
	lsls r0, r0, #1
	cmp r1, r0
	bne _0800FC80
	adds r1, r5, #1
	mov r6, ip
	ldr r0, [r6]
	ldr r2, [r0]
	ldrh r0, [r2]
	cmp r1, r0
	blt _0800FBF4
	b _0800FD38
_0800FBF4:
	subs r3, r4, #1
	cmp r3, #0
	bge _0800FBFC
	b _0800FD38
_0800FBFC:
	lsls r1, r4, #1
	ldr r4, _0800FC70 @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r6, _0800FC74 @ =0x00000A22
	adds r1, r2, r6
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r2, _0800FC78 @ =0xFFFFFEBF
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800FC3E
	cmp r1, r7
	beq _0800FC3E
	cmp r1, r8
	beq _0800FC3E
	movs r0, #0x91
	lsls r0, r0, #1
	cmp r1, r0
	beq _0800FC3E
	subs r0, #1
	cmp r1, r0
	beq _0800FC3E
	subs r0, #1
	cmp r1, r0
	beq _0800FC3E
	b _0800FD38
_0800FC3E:
	mov r4, ip
	ldr r0, [r4]
	ldr r1, [r0]
	lsls r2, r3, #1
	ldr r6, _0800FC70 @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r2, _0800FC74 @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r0, _0800FC7C @ =0x00000143
	cmp r1, r0
	beq _0800FD24
	subs r0, #3
	cmp r1, r0
	beq _0800FD24
	adds r0, #1
	cmp r1, r0
	beq _0800FD24
	adds r0, #0x22
	b _0800FD0E
	.align 2, 0
_0800FC70: .4byte 0x0000417A
_0800FC74: .4byte 0x00000A22
_0800FC78: .4byte 0xFFFFFEBF
_0800FC7C: .4byte 0x00000143
_0800FC80:
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	bne _0800FD38
	adds r1, r5, #1
	mov r3, ip
	ldr r0, [r3]
	ldr r2, [r0]
	ldrh r6, [r2]
	cmp r1, r6
	bge _0800FD38
	adds r3, r4, #1
	ldrh r0, [r2, #2]
	cmp r3, r0
	bge _0800FD38
	lsls r1, r4, #1
	ldr r4, _0800FD28 @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r6, _0800FD2C @ =0x00000A22
	adds r1, r2, r6
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r2, _0800FD30 @ =0xFFFFFEBF
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800FCDE
	cmp r1, r7
	beq _0800FCDE
	cmp r1, r8
	beq _0800FCDE
	movs r0, #0x91
	lsls r0, r0, #1
	cmp r1, r0
	beq _0800FCDE
	subs r0, #1
	cmp r1, r0
	beq _0800FCDE
	subs r0, #1
	cmp r1, r0
	bne _0800FD38
_0800FCDE:
	mov r4, ip
	ldr r0, [r4]
	ldr r1, [r0]
	lsls r2, r3, #1
	ldr r6, _0800FD28 @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r2, _0800FD2C @ =0x00000A22
	adds r1, r1, r2
_0800FCF6:
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r0, _0800FD34 @ =0x00000143
	cmp r1, r0
	beq _0800FD24
	adds r0, #0x1d
	cmp r1, r0
	beq _0800FD24
	adds r0, #1
	cmp r1, r0
	beq _0800FD24
	adds r0, #2
_0800FD0E:
	cmp r1, r0
	beq _0800FD24
	subs r0, #0x40
	cmp r1, r0
	beq _0800FD24
	subs r0, #0x20
_0800FD1A:
	cmp r1, r0
	beq _0800FD24
	subs r0, #1
	cmp r1, r0
	bne _0800FD38
_0800FD24:
	movs r0, #1
	b _0800FD3A
	.align 2, 0
_0800FD28: .4byte 0x0000417A
_0800FD2C: .4byte 0x00000A22
_0800FD30: .4byte 0xFFFFFEBF
_0800FD34: .4byte 0x00000143
_0800FD38:
	movs r0, #0
_0800FD3A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

