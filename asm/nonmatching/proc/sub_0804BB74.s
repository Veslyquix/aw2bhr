	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804BB74
sub_0804BB74: @ 0x0804BB74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r1
	adds r6, r2, #0
	adds r4, r3, #0
	ldr r1, _0804BBFC @ =gUnknown_08555850
	mov r8, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r5, r1, #3
	mov r0, r8
	adds r0, #8
	adds r0, r5, r0
	ldr r0, [r0]
	ldr r7, _0804BC00 @ =gUnknown_0200FC50
	adds r1, r7, #0
	bl LZ77UnCompWram
	cmp r4, #0
	beq _0804BC5C
	mov r2, r8
	adds r0, r5, r2
	ldrb r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0804BC08
	movs r2, #0
	movs r3, #0
	ldr r0, _0804BC04 @ =gUnknown_08136044
	mov sb, r0
	lsrs r6, r6, #2
	mov r8, r6
	ldr r1, [r0]
	mov ip, r1
	movs r0, #0x88
	lsls r0, r0, #7
	adds r6, r0, #0
_0804BBC8:
	movs r4, #0x1f
	adds r5, r3, #1
	lsls r0, r3, #6
	adds r0, r0, r7
	adds r3, r0, #0
	adds r3, #0x3e
_0804BBD4:
	mov r1, ip
	ldr r0, [r1]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r3]
	adds r0, r0, r6
	strh r0, [r1]
	subs r3, #2
	subs r4, #1
	adds r2, #1
	cmp r4, #0
	bge _0804BBD4
	adds r3, r5, #0
	cmp r3, #0x40
	bgt _0804BC88
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r2, r0
	bne _0804BBC8
	b _0804BC88
	.align 2, 0
_0804BBFC: .4byte gUnknown_08555850
_0804BC00: .4byte gUnknown_0200FC50
_0804BC04: .4byte gUnknown_08136044
_0804BC08:
	movs r2, #0
	ldr r0, _0804BC58 @ =gUnknown_08136044
	mov sb, r0
	lsrs r6, r6, #2
	mov r8, r6
	ldr r1, [r0]
	mov ip, r1
	movs r0, #0x88
	lsls r0, r0, #7
	adds r6, r0, #0
	adds r5, r7, #0
	movs r1, #0xb0
	lsls r1, r1, #4
	adds r7, r5, r1
_0804BC24:
	movs r4, #0x10
	adds r3, r5, #0
	adds r3, #0x20
_0804BC2A:
	mov r1, ip
	ldr r0, [r1]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r3]
	adds r0, r0, r6
	strh r0, [r1, #0x1a]
	subs r3, #2
	subs r4, #1
	adds r2, #1
	cmp r4, #0
	bge _0804BC2A
	adds r2, #0xf
	adds r1, r2, #0
	adds r1, #0xf
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	bgt _0804BC88
	adds r5, #0x40
	cmp r5, r7
	ble _0804BC24
	b _0804BC88
	.align 2, 0
_0804BC58: .4byte gUnknown_08136044
_0804BC5C:
	movs r3, #0
	ldr r2, _0804BCAC @ =0x000007FF
	mov ip, r2
	ldr r0, _0804BCB0 @ =gUnknown_08136044
	mov sb, r0
	lsrs r6, r6, #2
	mov r8, r6
	ldr r5, [r0]
	adds r4, r7, #0
	movs r1, #0x80
	lsls r1, r1, #5
	adds r2, r1, #0
_0804BC74:
	ldr r0, [r5]
	lsls r1, r3, #1
	adds r1, r1, r0
	ldrh r0, [r4]
	adds r0, r0, r2
	strh r0, [r1]
	adds r4, #2
	adds r3, #1
	cmp r3, ip
	ble _0804BC74
_0804BC88:
	mov r2, sb
	ldr r0, [r2]
	ldr r0, [r0]
	ldr r1, _0804BCB4 @ =0x001FFFFF
	mov r2, r8
	ands r2, r1
	mov r8, r2
	mov r1, sl
	bl CpuFastSet
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BCAC: .4byte 0x000007FF
_0804BCB0: .4byte gUnknown_08136044
_0804BCB4: .4byte 0x001FFFFF

