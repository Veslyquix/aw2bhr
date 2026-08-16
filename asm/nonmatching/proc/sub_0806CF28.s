	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CF28
sub_0806CF28: @ 0x0806CF28
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0806CFB0 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0806CF4E
	ldr r0, [r4, #0x30]
	cmp r0, #0
	ble _0806CF4E
	bl sub_080718F0
	bl sub_080135A4
	ldr r0, [r4, #0x30]
	subs r0, #1
	str r0, [r4, #0x30]
_0806CF4E:
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bne _0806CF6C
	ldr r0, _0806CFB4 @ =gUnknown_08581E10
	bl Proc_Find
	movs r1, #1
	str r1, [r0, #0x34]
	movs r0, #0xd5
	lsls r0, r0, #1
	bl sub_0803B524
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x30]
_0806CF6C:
	ldr r3, _0806CFB8 @ =gUnknown_08581D60
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0x10
	bl sub_0801BEBC
	ldr r3, _0806CFBC @ =gUnknown_08581D38
	str r4, [sp]
	movs r0, #0
	movs r1, #0xb0
	movs r2, #0
	bl sub_0801BEBC
	ldr r3, _0806CFC0 @ =gUnknown_08581DA4
	str r4, [sp]
	movs r0, #0
	movs r1, #0x16
	movs r2, #0xf
	bl sub_0801BEBC
	ldr r3, _0806CFC4 @ =gUnknown_08581E06
	str r4, [sp]
	movs r0, #0
	movs r1, #0xca
	movs r2, #0x22
	bl sub_0801BEBC
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806CFB0: .4byte gUnknown_03004008
_0806CFB4: .4byte gUnknown_08581E10
_0806CFB8: .4byte gUnknown_08581D60
_0806CFBC: .4byte gUnknown_08581D38
_0806CFC0: .4byte gUnknown_08581DA4
_0806CFC4: .4byte gUnknown_08581E06

