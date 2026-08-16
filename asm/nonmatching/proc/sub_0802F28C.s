	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802F28C
sub_0802F28C: @ 0x0802F28C
	push {r4, r5, r6, r7, lr}
	movs r2, #0
	ldr r4, _0802F338 @ =gUnknown_02025564
	movs r3, #0
_0802F294:
	adds r0, r2, r4
	ldrb r1, [r0]
	strb r3, [r0]
	adds r2, #1
	cmp r2, #1
	ble _0802F294
	movs r2, #0
	ldr r4, _0802F33C @ =gUnknown_02025566
	movs r3, #0
_0802F2A6:
	adds r0, r2, r4
	ldrb r1, [r0]
	strb r3, [r0]
	adds r2, #1
	cmp r2, #2
	ble _0802F2A6
	movs r2, #0
	ldr r4, _0802F340 @ =gUnknown_02025569
	movs r3, #0
_0802F2B8:
	adds r0, r2, r4
	ldrb r1, [r0]
	strb r3, [r0]
	adds r2, #1
	cmp r2, #0x17
	ble _0802F2B8
	movs r4, #0
	ldr r6, _0802F338 @ =gUnknown_02025564
	movs r1, #0
	movs r5, #0
	adds r3, r6, #0
	adds r3, #0x20
	adds r7, r6, #0
	adds r7, #0x34
_0802F2D4:
	strb r1, [r3, #1]
	strb r1, [r3]
	strb r1, [r3, #0x13]
	strb r1, [r3, #0x1a]
	strb r1, [r3, #0x19]
	movs r2, #0x10
	lsls r0, r5, #2
	adds r0, r6, r0
	adds r0, #0x32
_0802F2E6:
	strb r1, [r0]
	subs r0, #1
	subs r2, #1
	cmp r2, #0
	bge _0802F2E6
	movs r2, #4
	lsls r0, r5, #2
	adds r0, r0, r7
	adds r0, #4
_0802F2F8:
	strb r1, [r0]
	subs r0, #1
	subs r2, #1
	cmp r2, #0
	bge _0802F2F8
	adds r5, #7
	adds r3, #0x1c
	adds r4, #1
	cmp r4, #0xb
	ble _0802F2D4
	movs r4, #0
	ldr r7, _0802F344 @ =gUnknown_020257E4
	movs r5, #0
	movs r6, #0xd
_0802F314:
	adds r3, r4, #1
	adds r0, r4, #0
	muls r0, r6, r0
	adds r1, r0, r7
	movs r2, #0xc
_0802F31E:
	ldrb r0, [r1]
	strb r5, [r1]
	adds r1, #1
	subs r2, #1
	cmp r2, #0
	bge _0802F31E
	adds r4, r3, #0
	cmp r4, #3
	ble _0802F314
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F338: .4byte gUnknown_02025564
_0802F33C: .4byte gUnknown_02025566
_0802F340: .4byte gUnknown_02025569
_0802F344: .4byte gUnknown_020257E4

