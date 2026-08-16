	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080289FC
sub_080289FC: @ 0x080289FC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _08028A20 @ =gUnknown_03003FC0
	ldrb r1, [r0, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08028A5C
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08028A24
_08028A1A:
	movs r0, #0
	b _08028A5E
	.align 2, 0
_08028A20: .4byte gUnknown_03003FC0
_08028A24:
	movs r4, #1
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r7, r0, #2
	movs r6, #0x3c
_08028A2E:
	cmp r5, r4
	beq _08028A54
	ldr r0, _08028A64 @ =gUnknown_08499598
	ldr r1, [r0]
	adds r0, r7, r1
	adds r0, #0x2a
	adds r1, r6, r1
	adds r1, #0x2a
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08028A54
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028A1A
_08028A54:
	adds r6, #0x3c
	adds r4, #1
	cmp r4, #4
	ble _08028A2E
_08028A5C:
	movs r0, #1
_08028A5E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08028A64: .4byte gUnknown_08499598

