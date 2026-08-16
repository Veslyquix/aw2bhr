	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08007DD0
sub_08007DD0: @ 0x08007DD0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r7, r1, #0
	movs r6, #0
	ldr r0, _08007EC0 @ =gUnknown_0808D7F0
	mov sb, r0
	cmp r7, #0
	ble _08007E1C
	subs r5, r7, #1
	cmp r4, #0
	ble _08007DF6
	subs r0, r4, #1
	adds r1, r5, #0
	bl IsTerrainLand
	lsls r6, r0, #8
_08007DF6:
	adds r0, r4, #0
	adds r1, r5, #0
	bl IsTerrainLand
	lsls r0, r0, #7
	orrs r6, r0
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _08007E1C
	adds r0, r4, #1
	adds r1, r5, #0
	bl IsTerrainLand
	lsls r0, r0, #6
	orrs r6, r0
_08007E1C:
	cmp r4, #0
	ble _08007E2C
	subs r0, r4, #1
	adds r1, r7, #0
	bl IsTerrainLand
	lsls r0, r0, #5
	orrs r6, r0
_08007E2C:
	adds r0, r4, #0
	adds r1, r7, #0
	bl IsTerrainLand
	lsls r0, r0, #4
	orrs r6, r0
	mov r2, sb
	ldr r2, [r2]
	mov r8, r2
	ldr r0, [r2]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _08007E54
	adds r0, r4, #1
	adds r1, r7, #0
	bl IsTerrainLand
	lsls r0, r0, #3
	orrs r6, r0
_08007E54:
	mov r3, r8
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r7, r0
	bge _08007E94
	adds r5, r7, #1
	cmp r4, #0
	ble _08007E72
	subs r0, r4, #1
	adds r1, r5, #0
	bl IsTerrainLand
	lsls r0, r0, #2
	orrs r6, r0
_08007E72:
	adds r0, r4, #0
	adds r1, r5, #0
	bl IsTerrainLand
	lsls r0, r0, #1
	orrs r6, r0
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _08007E94
	adds r0, r4, #1
	adds r1, r5, #0
	bl IsTerrainLand
	orrs r6, r0
_08007E94:
	mov r2, sb
	ldr r0, [r2]
	ldr r1, [r0]
	lsls r2, r7, #1
	ldr r3, _08007EC4 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _08007EC8 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xd
	bne _08007ECC
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_0800B61C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	b _08007F02
	.align 2, 0
_08007EC0: .4byte gUnknown_0808D7F0
_08007EC4: .4byte 0x0000417A
_08007EC8: .4byte 0x00001432
_08007ECC:
	cmp r0, #2
	bne _08007ED6
_08007ED0:
	movs r0, #1
	rsbs r0, r0, #0
	b _08007F02
_08007ED6:
	cmp r0, #0xc
	bne _08007EF8
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_08008C34
	cmp r0, #0
	bne _08007ED0
	ldr r1, _08007EF4 @ =gUnknown_08485DC4
	lsls r0, r6, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	b _08007F02
	.align 2, 0
_08007EF4: .4byte gUnknown_08485DC4
_08007EF8:
	ldr r1, _08007F10 @ =gUnknown_08485DC4
	lsls r0, r6, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
_08007F02:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007F10: .4byte gUnknown_08485DC4

