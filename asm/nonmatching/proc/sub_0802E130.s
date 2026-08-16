	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E130
sub_0802E130: @ 0x0802E130
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0802E240 @ =gUnknown_08090C2C
	ldr r1, [r0]
	ldr r1, [r1]
	ldrb r1, [r1]
	mov r8, r1
	mov sb, r0
	cmp r1, #0x20
	bls _0802E14C
	movs r0, #0x20
	mov r8, r0
_0802E14C:
	movs r3, #0
	mov r1, r8
	lsrs r6, r1, #1
	ldr r5, _0802E244 @ =gUnknown_08499578
	movs r4, #0
	ldr r2, _0802E248 @ =0x000003FF
_0802E158:
	ldr r0, [r5]
	lsls r1, r3, #1
	adds r1, r1, r0
	strh r4, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r2
	bls _0802E158
	movs r3, #0
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	cmp r3, r0
	bhs _0802E1BA
	ldr r7, _0802E24C @ =gUnknown_03003F68
	mov ip, r0
_0802E178:
	ldr r0, [r7]
	ldrb r0, [r0, #1]
	lsrs r0, r0, #1
	movs r2, #0
	adds r4, r3, #1
	cmp r0, #0
	beq _0802E1B2
	ldr r6, _0802E244 @ =gUnknown_08499578
	movs r0, #0xa0
	lsls r0, r0, #7
	adds r5, r0, #0
_0802E18E:
	lsls r1, r2, #1
	adds r1, r1, r3
	ldr r0, [r6]
	lsls r1, r1, #1
	adds r1, r1, r0
	adds r0, r2, r3
	adds r0, r0, r5
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r7]
	ldrb r0, [r0, #1]
	lsrs r0, r0, #1
	lsls r0, r0, #4
	cmp r2, r0
	blt _0802E18E
_0802E1B2:
	lsls r0, r4, #0x10
	lsrs r3, r0, #0x10
	cmp r3, ip
	blo _0802E178
_0802E1BA:
	mov r1, sb
	ldr r2, [r1]
	ldr r1, [r2]
	ldrb r0, [r1]
	cmp r0, #0x1f
	bls _0802E22E
	movs r3, #0
	mov r7, r8
	subs r0, r0, r7
	asrs r0, r0, #1
	cmp r3, r0
	bge _0802E22E
	adds r5, r2, #0
_0802E1D4:
	ldr r0, [r5]
	ldrb r0, [r0, #1]
	lsrs r0, r0, #1
	movs r2, #0
	adds r4, r3, #1
	cmp r0, #0
	beq _0802E21C
	ldr r0, _0802E244 @ =gUnknown_08499578
	mov ip, r0
	movs r1, #0x80
	lsls r1, r1, #1
	mov sb, r1
	movs r7, #0xa0
	lsls r7, r7, #7
	adds r6, r7, #0
_0802E1F2:
	lsls r1, r2, #1
	mov r7, ip
	ldr r0, [r7]
	adds r1, r3, r1
	lsls r1, r1, #1
	adds r1, r1, r0
	mov r7, sb
	adds r0, r2, r7
	adds r0, r3, r0
	adds r0, r0, r6
	strh r0, [r1, #0x20]
	adds r0, r2, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r5]
	ldrb r0, [r0, #1]
	lsrs r0, r0, #1
	lsls r0, r0, #4
	cmp r2, r0
	blt _0802E1F2
_0802E21C:
	lsls r0, r4, #0x10
	lsrs r3, r0, #0x10
	ldr r0, [r5]
	ldrb r0, [r0]
	mov r1, r8
	subs r0, r0, r1
	asrs r0, r0, #1
	cmp r3, r0
	blt _0802E1D4
_0802E22E:
	bl sub_08013AEC
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E240: .4byte gUnknown_08090C2C
_0802E244: .4byte gUnknown_08499578
_0802E248: .4byte 0x000003FF
_0802E24C: .4byte gUnknown_03003F68

