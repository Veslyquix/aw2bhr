	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031A9C
sub_08031A9C: @ 0x08031A9C
	push {r4, r5, r6, r7, lr}
	movs r2, #0
	ldr r4, _08031B10 @ =gUnknown_02028040
	ldr r3, _08031B14 @ =gUnknown_02025564
_08031AA4:
	adds r0, r2, r4
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #1
	ble _08031AA4
	movs r2, #0
	ldr r4, _08031B18 @ =gUnknown_0202805A
	ldr r3, _08031B1C @ =gUnknown_02025566
_08031AB8:
	adds r0, r2, r4
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #2
	ble _08031AB8
	movs r2, #0
	ldr r4, _08031B20 @ =gUnknown_02028042
	ldr r3, _08031B24 @ =gUnknown_02025569
_08031ACC:
	adds r0, r2, r4
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #0x17
	ble _08031ACC
	ldr r0, _08031B28 @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #1
	bne _08031B08
	ldr r0, _08031B14 @ =gUnknown_02025564
	adds r4, r0, #0
	adds r4, #0x20
	ldr r3, _08031B2C @ =gUnknown_020280C0
	movs r2, #0xb
_08031AEE:
	adds r0, r3, #0
	adds r1, r4, #0
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldr r1, [r1]
	str r1, [r0]
	adds r4, #0x1c
	adds r3, #0x1c
	subs r2, #1
	cmp r2, #0
	bge _08031AEE
_08031B08:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031B10: .4byte gUnknown_02028040
_08031B14: .4byte gUnknown_02025564
_08031B18: .4byte gUnknown_0202805A
_08031B1C: .4byte gUnknown_02025566
_08031B20: .4byte gUnknown_02028042
_08031B24: .4byte gUnknown_02025569
_08031B28: .4byte gUnknown_0849B018
_08031B2C: .4byte gUnknown_020280C0

