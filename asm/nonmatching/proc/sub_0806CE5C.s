	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CE5C
sub_0806CE5C: @ 0x0806CE5C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x58
	mov r8, r0
	ldr r3, [r5, #0x30]
	movs r4, #0x16
	str r4, [sp]
	movs r0, #1
	movs r1, #0xf0
	movs r2, #0x16
	bl sub_08074234
	adds r7, r0, #0
	movs r1, #0xf0
	rsbs r1, r1, #0
	ldr r3, [r5, #0x30]
	str r4, [sp]
	movs r0, #1
	movs r2, #8
	bl sub_08074234
	adds r6, r0, #0
	ldr r3, [r5, #0x30]
	cmp r3, #0xd
	ble _0806CEA6
	subs r3, #0xe
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
	movs r2, #0xb0
	bl sub_08074234
	mov r8, r0
_0806CEA6:
	ldr r3, _0806CEF8 @ =gUnknown_08581D60
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl sub_0801BEBC
	ldr r3, _0806CEFC @ =gUnknown_08581D38
	str r4, [sp]
	movs r0, #0
	mov r1, r8
	movs r2, #0
	bl sub_0801BEBC
	ldr r3, _0806CF00 @ =gUnknown_08581DA4
	str r4, [sp]
	movs r0, #0
	adds r1, r7, #0
	movs r2, #0xf
	bl sub_0801BEBC
	ldr r0, [r5, #0x30]
	cmp r0, #0x16
	bne _0806CEE4
	movs r0, #0x79
	bl sub_0803B4DC
	adds r0, r5, #0
	bl Proc_Break
_0806CEE4:
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CEF8: .4byte gUnknown_08581D60
_0806CEFC: .4byte gUnknown_08581D38
_0806CF00: .4byte gUnknown_08581DA4

