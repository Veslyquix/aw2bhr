	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003B8C
sub_08003B8C: @ 0x08003B8C
	push {r4, r5, r6, lr}
	bl sub_08025E74
	ldr r4, _08003BE4 @ =gUnknown_0808D788
	ldr r0, [r4]
	ldr r0, [r0]
	movs r2, #0
	strb r2, [r0, #0x13]
	ldr r3, _08003BE8 @ =gUnknown_08499590
	ldr r1, [r3]
	movs r0, #0x1e
	strh r0, [r1]
	movs r0, #0x14
	strh r0, [r1, #2]
	strh r2, [r1, #0x10]
	movs r5, #0
	adds r6, r4, #0
	adds r4, r3, #0
	ldr r3, _08003BEC @ =0x0000417A
_08003BB2:
	ldr r2, [r4]
	lsls r0, r5, #1
	adds r1, r2, r3
	adds r1, r1, r0
	ldrh r0, [r2]
	muls r0, r5, r0
	strh r0, [r1]
	adds r5, #1
	ldrh r2, [r2, #2]
	cmp r5, r2
	blt _08003BB2
	ldr r0, _08003BF0 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #2
	adds r2, r0, #0
	ands r2, r1
	cmp r2, r0
	bne _08003BF4
	bl sub_08004724
	bl sub_08003ED0
	b _08003C2E
	.align 2, 0
_08003BE4: .4byte gUnknown_0808D788
_08003BE8: .4byte gUnknown_08499590
_08003BEC: .4byte 0x0000417A
_08003BF0: .4byte gpKeySt
_08003BF4:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r2, r0
	beq _08003C1C
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r2, r0
	bne _08003C0E
	bl sub_0800449C
	bl sub_08003ED0
	b _08003C2E
_08003C0E:
	bl sub_080129E0
	movs r1, #0x64
	bl DivRem
	cmp r0, #0x1d
	ble _08003C26
_08003C1C:
	bl sub_080040C8
	bl sub_08003ED0
	b _08003C2E
_08003C26:
	bl sub_0800449C
	bl sub_08003ED0
_08003C2E:
	bl sub_080219AC
	bl sub_0800C8D8
	bl sub_0800C874
	ldr r1, [r6]
	ldr r1, [r1]
	strb r0, [r1, #0x12]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

