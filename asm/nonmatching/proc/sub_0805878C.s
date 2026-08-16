	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805878C
sub_0805878C: @ 0x0805878C
	push {r4, r5, r6, r7, lr}
	ldr r0, _080587CC @ =gUnknown_03003338
	ldr r1, [r0]
	movs r7, #0
	movs r3, #0
	movs r6, #0
	movs r5, #0
	ldrh r2, [r1]
	cmp r2, #0
	beq _080587E2
	movs r0, #0x80
	lsls r0, r0, #8
	mov ip, r0
	movs r4, #0xff
	lsls r4, r4, #8
_080587AA:
	mov r0, ip
	ands r0, r2
	cmp r0, #0
	beq _080587D0
	ldrh r0, [r1, #2]
	cmp r0, r6
	ble _080587DA
	adds r6, r0, #0
	adds r3, r1, #0
	adds r0, r4, #0
	ands r0, r2
	cmp r0, r4
	beq _080587DA
	movs r0, #0xff
	ands r0, r2
	strh r0, [r3]
	b _080587DA
	.align 2, 0
_080587CC: .4byte gUnknown_03003338
_080587D0:
	ldrh r0, [r1, #2]
	cmp r0, r5
	ble _080587DA
	adds r5, r0, #0
	adds r7, r1, #0
_080587DA:
	adds r1, #8
	ldrh r2, [r1]
	cmp r2, #0
	bne _080587AA
_080587E2:
	cmp r7, #0
	beq _080587EA
	adds r0, r7, #0
	b _080587F4
_080587EA:
	cmp r3, #0
	bne _080587F2
	movs r0, #0
	b _080587F4
_080587F2:
	adds r0, r3, #0
_080587F4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

