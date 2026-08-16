	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080439A8
sub_080439A8: @ 0x080439A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	str r1, [sp, #4]
	adds r5, r2, #0
	str r3, [sp, #8]
	ldr r6, [sp, #0x34]
	adds r0, r3, #0
	movs r1, #2
	bl Div
	mov r8, r0
	cmp r6, #0
	ble _08043A70
_080439CC:
	ldr r0, [r5]
	mov r1, r8
	bl Div
	adds r4, r0, #0
	cmp r4, #1
	ble _080439DC
	movs r4, #2
_080439DC:
	ldr r1, [r5]
	cmp r1, r8
	bge _080439E6
	movs r0, #0
	b _080439EC
_080439E6:
	mov r0, r8
	muls r0, r4, r0
	subs r0, r1, r0
_080439EC:
	str r0, [r5]
	ldr r0, [sp, #0x38]
	cmp r0, #0
	beq _080439F8
	cmp r0, #1
	beq _08043A08
_080439F8:
	ldr r1, _08043A04 @ =gUnknown_084A0042
	mov sl, r1
	movs r3, #1
	movs r2, #0x20
	str r2, [sp, #0x10]
	b _08043A12
	.align 2, 0
_08043A04: .4byte gUnknown_084A0042
_08043A08:
	ldr r3, _08043A34 @ =gUnknown_084A004A
	mov sl, r3
	movs r3, #4
	movs r7, #0x23
	str r7, [sp, #0x10]
_08043A12:
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _08043A3C
	ldr r2, [sp, #0x40]
	ldr r1, [r2]
	adds r0, r1, #0
	subs r1, #1
	str r1, [r2]
	movs r1, #0x20
	str r3, [sp, #0xc]
	bl DivRem
	ldr r7, _08043A38 @ =gUnknown_084A006E
	adds r0, r0, r7
	ldrb r0, [r0]
	ldr r3, [sp, #0xc]
	b _08043A3E
	.align 2, 0
_08043A34: .4byte gUnknown_084A004A
_08043A38: .4byte gUnknown_084A006E
_08043A3C:
	movs r0, #0
_08043A3E:
	mov r2, sb
	ldr r1, [r2]
	ldr r7, [sp, #4]
	ldr r2, [r7]
	subs r2, r2, r0
	adds r0, r4, #0
	muls r0, r3, r0
	ldr r3, [sp, #0x10]
	adds r0, r3, r0
	movs r3, #0xe0
	lsls r3, r3, #7
	orrs r0, r3
	str r0, [sp]
	movs r0, #0
	mov r3, sl
	bl sub_0801BEBC
	mov r7, sb
	ldr r0, [r7]
	adds r0, #6
	str r0, [r7]
	ldr r0, [sp, #8]
	subs r6, r6, r0
	cmp r6, #0
	bgt _080439CC
_08043A70:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

