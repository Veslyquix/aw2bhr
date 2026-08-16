	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015A9C
sub_08015A9C: @ 0x08015A9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	movs r4, #0
	mov sl, r4
	ldr r2, _08015B90 @ =gUnknown_03001470
	movs r3, #1
_08015AB0:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #5
	adds r1, r0, r2
	ldr r0, [r1]
	cmp r0, #0
	beq _08015AD8
	ldrh r1, [r1, #0x12]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08015AD8
	mov r0, sp
	add r0, sl
	strb r4, [r0]
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
_08015AD8:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x1d
	bls _08015AB0
	mov r0, sl
	cmp r0, #0
	beq _08015B80
	cmp r0, #1
	beq _08015B54
	movs r4, #0
	subs r0, #1
	str r0, [sp, #0x24]
	cmp r4, r0
	bge _08015B54
_08015AF6:
	adds r1, r4, #1
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	str r1, [sp, #0x20]
	cmp r5, sl
	bhs _08015B48
	ldr r1, _08015B90 @ =gUnknown_03001470
	mov r8, r1
	add r4, sp
	mov ip, r4
	movs r0, #0x7f
	mov sb, r0
_08015B0E:
	mov r1, ip
	ldrb r7, [r1]
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #5
	add r0, r8
	ldrb r3, [r0, #0x14]
	mov r0, sp
	adds r6, r0, r5
	ldrb r4, [r6]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #5
	add r0, r8
	ldrb r2, [r0, #0x14]
	mov r1, sb
	ands r1, r3
	mov r0, sb
	ands r0, r2
	cmp r1, r0
	bls _08015B3E
	mov r1, ip
	strb r4, [r1]
	strb r7, [r6]
_08015B3E:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, sl
	blo _08015B0E
_08015B48:
	ldr r1, [sp, #0x20]
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [sp, #0x24]
	cmp r4, r0
	blt _08015AF6
_08015B54:
	movs r4, #0
	cmp r4, sl
	bhs _08015B80
	ldr r5, _08015B90 @ =gUnknown_03001470
_08015B5C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _08015B76
	adds r0, r1, #0
	bl sub_080159E0
_08015B76:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sl
	blo _08015B5C
_08015B80:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015B90: .4byte gUnknown_03001470

