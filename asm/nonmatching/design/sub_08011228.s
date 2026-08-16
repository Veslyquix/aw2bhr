	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011228
sub_08011228: @ 0x08011228
	push {r4, r5, r6, r7, lr}
	ldr r7, _08011264 @ =gUnknown_0200B274
	movs r4, #0
	ldr r6, _08011268 @ =gUnknown_03001408
	movs r5, #0xf0
_08011232:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0801126C
	adds r2, r4, #1
	asrs r1, r2, #1
	ldrh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	adds r3, r1, #0
	subs r3, #0x50
	cmp r3, #0
	bge _08011250
	movs r3, #0
_08011250:
	cmp r3, #0xef
	ble _08011256
	movs r3, #0xf0
_08011256:
	lsls r1, r4, #1
	adds r1, r1, r7
	subs r0, r5, r3
	lsls r0, r0, #8
	orrs r0, r5
	strh r0, [r1]
	b _0801128A
	.align 2, 0
_08011264: .4byte gUnknown_0200B274
_08011268: .4byte gUnknown_03001408
_0801126C:
	ldrh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r2, r4, #1
	asrs r1, r2, #1
	subs r3, r0, r1
	cmp r3, #0
	bgt _0801127E
	movs r3, #0
_0801127E:
	cmp r3, #0xef
	ble _08011284
	movs r3, #0xf0
_08011284:
	lsls r0, r4, #1
	adds r0, r0, r7
	strh r3, [r0]
_0801128A:
	adds r4, r2, #0
	cmp r4, #0x9f
	ble _08011232
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

