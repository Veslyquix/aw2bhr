	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CBA8
sub_0806CBA8: @ 0x0806CBA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	blt _0806CBDC
	asrs r0, r0, #1
	movs r1, #0x40
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl sub_08072C40
	ldr r0, [r4, #0x30]
	movs r1, #3
	ands r0, r1
	cmp r0, #2
	bne _0806CBD6
	bl sub_080718F0
	bl sub_080135A4
_0806CBD6:
	ldr r0, [r4, #0x30]
	subs r0, #1
	str r0, [r4, #0x30]
_0806CBDC:
	ldr r0, [r4, #0x30]
	cmp r0, #0xa
	bne _0806CBF2
	ldr r0, _0806CBFC @ =gUnknown_08581E28
	adds r1, r4, #0
	bl Proc_Start
	ldr r1, [r4, #0x34]
	str r1, [r0, #0x34]
	bl sub_0803B5E8
_0806CBF2:
	bl sub_0806CC4C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806CBFC: .4byte gUnknown_08581E28

