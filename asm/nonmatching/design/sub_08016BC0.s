	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016BC0
sub_08016BC0: @ 0x08016BC0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r3, #0
	adds r6, r7, #0
	adds r6, #0x48
	ldr r0, _08016C58 @ =gUnknown_0200C078
	mov ip, r0
	movs r5, #0
_08016BD0:
	mov r2, ip
	adds r4, r5, r2
	adds r1, r5, #0
	movs r2, #4
_08016BD8:
	adds r0, r6, r1
	ldr r0, [r0]
	stm r4!, {r0}
	adds r1, #4
	subs r2, #1
	cmp r2, #0
	bge _08016BD8
	adds r5, #0x14
	adds r3, #1
	cmp r3, #0x1d
	ble _08016BD0
	movs r3, #0
	ldr r6, _08016C5C @ =gUnknown_0200C2D0
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r5, r7, r0
_08016BF8:
	adds r4, r3, #1
	lsls r0, r3, #3
	adds r3, r0, r5
	adds r1, r0, r6
	movs r2, #4
_08016C02:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #1
	cmp r2, #0
	bge _08016C02
	adds r3, r4, #0
	cmp r3, #0x29
	ble _08016BF8
	ldr r4, _08016C60 @ =gUnknown_0200C420
	movs r2, #0xfc
	lsls r2, r2, #2
	adds r1, r7, r2
	adds r0, r4, #0
	movs r2, #0xe0
	bl sub_0808B6E8
	ldrb r0, [r4, #0xe]
	cmp r0, #3
	bls _08016C2C
	movs r0, #1
	strb r0, [r4, #0xe]
_08016C2C:
	ldrb r0, [r4, #0x14]
	cmp r0, #1
	bls _08016C36
	movs r0, #0
	strb r0, [r4, #0x14]
_08016C36:
	ldr r0, _08016C64 @ =gUnknown_02028030
	adds r1, r7, #0
	movs r2, #0x48
	bl sub_0808B6E8
	ldr r0, _08016C68 @ =gUnknown_0202FDFC
	movs r2, #0x9a
	lsls r2, r2, #3
	adds r1, r7, r2
	movs r2, #0xfc
	bl sub_0808B6E8
	ldr r0, _08016C6C @ =0x000005CC
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08016C58: .4byte gUnknown_0200C078
_08016C5C: .4byte gUnknown_0200C2D0
_08016C60: .4byte gUnknown_0200C420
_08016C64: .4byte gUnknown_02028030
_08016C68: .4byte gUnknown_0202FDFC
_08016C6C: .4byte 0x000005CC

