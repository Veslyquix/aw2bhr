	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801394C
sub_0801394C: @ 0x0801394C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080139B8 @ =gUnknown_0200B5F4
	adds r2, r0, r2
	strb r1, [r2]
	movs r1, #0
	ldr r7, _080139BC @ =gUnknown_0200B614
	lsls r0, r0, #4
	mov ip, r0
	ldr r0, _080139C0 @ =gUnknown_030020C0
	mov r8, r0
	movs r6, #0x1f
_0801396A:
	lsls r3, r1, #0x18
	asrs r3, r3, #0x18
	mov r0, ip
	adds r2, r0, r3
	lsls r4, r2, #1
	adds r2, r4, r2
	adds r5, r2, r7
	add r4, r8
	ldrb r1, [r4]
	adds r0, r6, #0
	ands r0, r1
	adds r0, #0x40
	strb r0, [r5]
	adds r1, r2, #1
	adds r1, r1, r7
	ldrh r0, [r4]
	lsrs r0, r0, #5
	ands r0, r6
	adds r0, #0x40
	strb r0, [r1]
	adds r2, #2
	adds r2, r2, r7
	ldrh r0, [r4]
	lsrs r0, r0, #0xa
	ands r0, r6
	adds r0, #0x40
	strb r0, [r2]
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r1, r3, #0x18
	asrs r3, r3, #0x18
	cmp r3, #0xf
	ble _0801396A
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080139B8: .4byte gUnknown_0200B5F4
_080139BC: .4byte gUnknown_0200B614
_080139C0: .4byte gUnknown_030020C0

