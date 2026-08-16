	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08068038
sub_08068038: @ 0x08068038
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	mov ip, r0
	ldr r2, _08068084 @ =gUnknown_0202F208
	str r0, [r2]
	ldr r3, [sp]
	ldrb r0, [r3]
	cmp r0, #0
	beq _080680D2
	lsls r1, r1, #5
	mov sb, r1
	ldr r0, _08068088 @ =gUnknown_08581160
	mov sl, r0
	mov r8, r2
_08068064:
	mov r1, ip
	lsls r0, r1, #9
	mov r7, ip
	adds r7, #1
	ldr r2, _0806808C @ =0x06010000
	adds r6, r0, r2
_08068070:
	mov r3, r8
	ldr r5, [r3]
	lsls r4, r5, #3
	mov r0, sl
	adds r3, r4, r0
	ldrb r2, [r3]
	cmp r2, #0xff
	bne _08068090
	ldr r0, [r0, #0x64]
	b _080680AA
	.align 2, 0
_08068084: .4byte gUnknown_0202F208
_08068088: .4byte gUnknown_08581160
_0806808C: .4byte 0x06010000
_08068090:
	ldr r1, [sp]
	add r1, ip
	ldrb r0, [r1]
	cmp r0, r2
	beq _080680A4
	adds r1, r0, #0
	ldrb r0, [r3]
	adds r0, #0x20
	cmp r1, r0
	bne _080680C0
_080680A4:
	ldr r1, _080680BC @ =gUnknown_08581164
	adds r0, r4, r1
	ldr r0, [r0]
_080680AA:
	mov r2, sb
	adds r1, r2, r6
	bl Decompress
	mov ip, r7
	movs r0, #0
	mov r3, r8
	str r0, [r3]
	b _080680C8
	.align 2, 0
_080680BC: .4byte gUnknown_08581164
_080680C0:
	adds r0, r5, #1
	mov r1, r8
	str r0, [r1]
	b _08068070
_080680C8:
	ldr r2, [sp]
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _08068064
_080680D2:
	mov r0, ip
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

