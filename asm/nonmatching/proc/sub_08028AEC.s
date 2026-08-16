	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028AEC
sub_08028AEC: @ 0x08028AEC
	push {r4, r5, r6, lr}
	movs r4, #1
_08028AF0:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	lsls r6, r4, #0x10
	cmp r0, #0
	beq _08028B5A
	lsrs r5, r6, #0x10
	adds r0, r5, #0
	bl sub_08028904
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08028B18
	asrs r0, r6, #0x10
	movs r1, #8
	bl sub_08028874
	b _08028B5A
_08028B18:
	asrs r4, r6, #0x10
	adds r0, r4, #0
	bl sub_080289BC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08028B30
	adds r0, r4, #0
	movs r1, #0x10
	bl sub_08028874
	b _08028B5A
_08028B30:
	adds r0, r5, #0
	bl sub_08028990
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08028B46
	adds r0, r4, #0
	movs r1, #1
	bl sub_08028874
	b _08028B5A
_08028B46:
	adds r0, r5, #0
	bl sub_08028944
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08028B5A
	adds r0, r4, #0
	movs r1, #2
	bl sub_08028874
_08028B5A:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r6, r1
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08028AF0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

