	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E010
sub_0802E010: @ 0x0802E010
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0802E120 @ =gUnknown_08090C28
	ldr r1, [r0]
	ldr r1, [r1]
	ldrb r1, [r1]
	mov r8, r1
	mov sb, r0
	cmp r1, #0x20
	bls _0802E02C
	movs r0, #0x20
	mov r8, r0
_0802E02C:
	movs r3, #0
	mov r1, r8
	lsrs r6, r1, #1
	ldr r5, _0802E124 @ =gUnknown_0849957C
	movs r4, #0
	ldr r2, _0802E128 @ =0x000003FF
_0802E038:
	ldr r0, [r5]
	lsls r1, r3, #1
	adds r1, r1, r0
	strh r4, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r2
	bls _0802E038
	movs r3, #0
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	cmp r3, r0
	bhs _0802E09A
	ldr r7, _0802E12C @ =gUnknown_03003F68
	mov ip, r0
_0802E058:
	ldr r0, [r7]
	ldrb r0, [r0, #1]
	lsrs r0, r0, #1
	movs r2, #0
	adds r4, r3, #1
	cmp r0, #0
	beq _0802E092
	ldr r6, _0802E124 @ =gUnknown_0849957C
	movs r0, #0xa0
	lsls r0, r0, #7
	adds r5, r0, #0
_0802E06E:
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
	blt _0802E06E
_0802E092:
	lsls r0, r4, #0x10
	lsrs r3, r0, #0x10
	cmp r3, ip
	blo _0802E058
_0802E09A:
	mov r1, sb
	ldr r2, [r1]
	ldr r1, [r2]
	ldrb r0, [r1]
	cmp r0, #0x1f
	bls _0802E10E
	movs r3, #0
	mov r7, r8
	subs r0, r0, r7
	asrs r0, r0, #1
	cmp r3, r0
	bge _0802E10E
	adds r5, r2, #0
_0802E0B4:
	ldr r0, [r5]
	ldrb r0, [r0, #1]
	lsrs r0, r0, #1
	movs r2, #0
	adds r4, r3, #1
	cmp r0, #0
	beq _0802E0FC
	ldr r0, _0802E124 @ =gUnknown_0849957C
	mov ip, r0
	movs r1, #0x80
	lsls r1, r1, #1
	mov sb, r1
	movs r7, #0xa0
	lsls r7, r7, #7
	adds r6, r7, #0
_0802E0D2:
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
	blt _0802E0D2
_0802E0FC:
	lsls r0, r4, #0x10
	lsrs r3, r0, #0x10
	ldr r0, [r5]
	ldrb r0, [r0]
	mov r1, r8
	subs r0, r0, r1
	asrs r0, r0, #1
	cmp r3, r0
	blt _0802E0B4
_0802E10E:
	bl sub_08013AFC
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E120: .4byte gUnknown_08090C28
_0802E124: .4byte gUnknown_0849957C
_0802E128: .4byte 0x000003FF
_0802E12C: .4byte gUnknown_03003F68

