	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061178
sub_08061178: @ 0x08061178
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_080129E0
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080611A8 @ =gUnknown_085766E0
	ldr r3, [r0]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r1, r0, #2
	adds r0, r3, r1
	ldrb r0, [r0, #0x14]
	cmp r0, #0xff
	bne _080611B4
	cmp r4, #2
	bhi _080611CE
	movs r0, #0
	b _080611D0
	.align 2, 0
_080611A8: .4byte gUnknown_085766E0
_080611AC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080611D0
_080611B4:
	movs r2, #0
	adds r0, r3, #0
	adds r0, #0x14
	adds r0, r1, r0
_080611BC:
	ldrb r1, [r0]
	cmp r1, #0xff
	beq _080611C6
	cmp r1, r5
	bhi _080611AC
_080611C6:
	adds r0, #1
	adds r2, #1
	cmp r2, #6
	ble _080611BC
_080611CE:
	movs r0, #1
_080611D0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

