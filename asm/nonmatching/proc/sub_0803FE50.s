	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803FE50
sub_0803FE50: @ 0x0803FE50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r2, r1, #0
	movs r0, #7
	ands r0, r2
	cmp r0, #0
	bne _0803FEB0
	ldr r1, _0803FEBC @ =gUnknown_0849FAD8
	movs r0, #0x18
	ands r0, r2
	asrs r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r7, r0, #3
	movs r0, #2
	bl sub_0803E354
	cmp r0, #0
	beq _0803FEB0
	ldr r6, _0803FEC0 @ =gUnknown_081245F8
	ldr r4, _0803FEC4 @ =0x000003FF
	adds r0, r7, #0
	ands r0, r4
	lsls r0, r0, #5
	adds r0, r0, r6
	mov r1, r8
	adds r1, #0xea
	ands r1, r4
	lsls r1, r1, #5
	ldr r5, _0803FEC8 @ =0x06010000
	adds r1, r1, r5
	movs r2, #0x80
	bl sub_08011E54
	adds r0, r7, #4
	ands r0, r4
	lsls r0, r0, #5
	adds r0, r0, r6
	mov r1, r8
	adds r1, #0xf2
	ands r1, r4
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x80
	bl sub_08011E54
_0803FEB0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FEBC: .4byte gUnknown_0849FAD8
_0803FEC0: .4byte gUnknown_081245F8
_0803FEC4: .4byte 0x000003FF
_0803FEC8: .4byte 0x06010000

