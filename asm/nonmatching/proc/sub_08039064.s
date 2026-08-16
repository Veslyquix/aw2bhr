	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039064
sub_08039064: @ 0x08039064
	push {r4, r5, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r3, #0
	bne _08039074
	movs r0, #0
	b _080390C6
_08039074:
	ldr r1, _08039098 @ =gUnknown_0849D5F8
	ldr r4, [r1]
	subs r5, r3, #1
	adds r1, r4, #0
	adds r1, #0x20
	adds r2, r1, r5
	adds r1, r1, r3
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge _0803909C
	movs r0, #3
	b _080390C6
	.align 2, 0
_08039098: .4byte gUnknown_0849D5F8
_0803909C:
	cmp r2, r1
	ble _080390A4
	movs r0, #1
	b _080390C6
_080390A4:
	adds r1, r4, #0
	adds r1, #0x2c
	adds r2, r1, r5
	adds r1, r1, r3
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge _080390C0
	movs r0, #4
	b _080390C6
_080390C0:
	cmp r2, r1
	ble _080390C6
	movs r0, #2
_080390C6:
	pop {r4, r5}
	pop {r1}
	bx r1

