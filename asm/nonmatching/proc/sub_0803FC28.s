	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803FC28
sub_0803FC28: @ 0x0803FC28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	adds r7, r1, #0
	mov sl, r2
	mov sb, r3
	movs r0, #0
	bl sub_0803F5C8
	adds r5, r0, #0
	b _0803FD5C
_0803FC46:
	ldrb r1, [r5]
	ldrb r2, [r5, #2]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	adds r6, r1, #0
	cmp r0, r8
	bge _0803FC58
	b _0803FD5A
_0803FC58:
	mov r0, r8
	add r0, sl
	cmp r0, r6
	bge _0803FC62
	b _0803FD5A
_0803FC62:
	ldrb r1, [r5, #1]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	adds r4, r1, #0
	cmp r0, r7
	bge _0803FC72
	b _0803FD5A
_0803FC72:
	mov r1, sb
	adds r0, r7, r1
	cmp r0, r4
	blt _0803FD5A
	lsls r0, r3, #0x16
	lsrs r0, r0, #0x1c
	subs r0, #2
	cmp r0, #6
	bhi _0803FD5A
	lsls r0, r0, #2
	ldr r1, _0803FC90 @ =_0803FC94
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803FC90: .4byte _0803FC94
_0803FC94: @ jump table
	.4byte _0803FD2C @ case 0
	.4byte _0803FCB0 @ case 1
	.4byte _0803FD5A @ case 2
	.4byte _0803FCD0 @ case 3
	.4byte _0803FD5A @ case 4
	.4byte _0803FD44 @ case 5
	.4byte _0803FD10 @ case 6
_0803FCB0:
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _0803FCD6
	ldrb r1, [r5, #3]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x40
	bne _0803FCC8
	ldr r4, _0803FCC4 @ =gUnknown_0849FA08
	b _0803FCF2
	.align 2, 0
_0803FCC4: .4byte gUnknown_0849FA08
_0803FCC8:
	ldr r4, _0803FCCC @ =gUnknown_0849FA22
	b _0803FCF2
	.align 2, 0
_0803FCCC: .4byte gUnknown_0849FA22
_0803FCD0:
	ldrb r0, [r5, #4]
	cmp r0, #0
	bne _0803FCE0
_0803FCD6:
	ldr r4, _0803FCDC @ =gUnknown_0849FA3C
	b _0803FCF2
	.align 2, 0
_0803FCDC: .4byte gUnknown_0849FA3C
_0803FCE0:
	bl sub_0803866C
	cmp r0, #0
	beq _0803FCF0
	ldr r4, _0803FCEC @ =gUnknown_0849FA78
	b _0803FCF2
	.align 2, 0
_0803FCEC: .4byte gUnknown_0849FA78
_0803FCF0:
	ldr r4, _0803FD0C @ =gUnknown_0849FA5E
_0803FCF2:
	movs r0, #5
	bl sub_08027198
	adds r3, r0, #0
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	movs r2, #0
	str r2, [sp]
	adds r2, r4, #0
	bl sub_0803F908
	b _0803FD5A
	.align 2, 0
_0803FD0C: .4byte gUnknown_0849FA5E
_0803FD10:
	movs r0, #5
	bl sub_08027198
	adds r3, r0, #0
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	ldr r2, _0803FD28 @ =gUnknown_0849FA56
	movs r4, #0
	str r4, [sp]
	bl sub_0803F908
	b _0803FD5A
	.align 2, 0
_0803FD28: .4byte gUnknown_0849FA56
_0803FD2C:
	ldr r2, _0803FD40 @ =gUnknown_0849FA56
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_0803F908
	b _0803FD5A
	.align 2, 0
_0803FD40: .4byte gUnknown_0849FA56
_0803FD44:
	movs r0, #5
	bl sub_08027198
	adds r3, r0, #0
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	ldr r2, _0803FD7C @ =gUnknown_0849FA9A
	movs r4, #0
	str r4, [sp]
	bl sub_0803F908
_0803FD5A:
	adds r5, #8
_0803FD5C:
	ldrh r3, [r5, #2]
	movs r0, #0xf0
	lsls r0, r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0803FD6A
	b _0803FC46
_0803FD6A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FD7C: .4byte gUnknown_0849FA9A

