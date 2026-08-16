	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060A20
sub_08060A20: @ 0x08060A20
	push {r4, r5, lr}
	movs r0, #6
	bl sub_08060ED4
	cmp r0, #0
	beq _08060A6C
	movs r0, #0x17
	bl sub_08057FA8
	adds r5, r0, #0
	movs r0, #7
	bl sub_08057F54
	adds r4, r0, #0
	cmp r4, #0
	bne _08060A44
	movs r2, #0x64
	b _08060A50
_08060A44:
	movs r0, #0x64
	muls r0, r5, r0
	adds r1, r4, #0
	bl __divsi3
	adds r2, r0, #0
_08060A50:
	ldr r0, _08060A74 @ =gUnknown_085766E0
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x22
	ldrb r1, [r1]
	cmp r4, r1
	ble _08060A6C
	ldrb r0, [r0, #7]
	lsrs r0, r0, #1
	cmp r2, r0
	bge _08060A6C
	ldr r1, _08060A78 @ =gUnknown_030046C0
	movs r0, #0x17
	strb r0, [r1, #6]
_08060A6C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060A74: .4byte gUnknown_085766E0
_08060A78: .4byte gUnknown_030046C0

