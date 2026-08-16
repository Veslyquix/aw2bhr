	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016B2C
sub_08016B2C: @ 0x08016B2C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r3, #0
	adds r7, r6, #0
	adds r7, #0x48
	ldr r0, _08016BA8 @ =gUnknown_0200C078
	mov ip, r0
	movs r5, #0
_08016B3C:
	mov r1, ip
	adds r4, r5, r1
	adds r2, r5, r7
	movs r1, #4
_08016B44:
	ldm r4!, {r0}
	stm r2!, {r0}
	subs r1, #1
	cmp r1, #0
	bge _08016B44
	adds r5, #0x14
	adds r3, #1
	cmp r3, #0x1d
	ble _08016B3C
	movs r3, #0
	ldr r7, _08016BAC @ =gUnknown_0200C2D0
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r5, r6, r0
_08016B60:
	adds r4, r3, #1
	lsls r0, r3, #3
	adds r3, r0, r7
	adds r2, r0, r5
	movs r1, #4
_08016B6A:
	ldm r3!, {r0}
	stm r2!, {r0}
	subs r1, #1
	cmp r1, #0
	bge _08016B6A
	adds r3, r4, #0
	cmp r3, #0x29
	ble _08016B60
	movs r1, #0xfc
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r1, _08016BB0 @ =gUnknown_0200C420
	movs r2, #0xe0
	bl sub_0808B6E8
	ldr r1, _08016BB4 @ =gUnknown_02028030
	adds r0, r6, #0
	movs r2, #0x48
	bl sub_0808B6E8
	movs r1, #0x9a
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r1, _08016BB8 @ =gUnknown_0202FDFC
	movs r2, #0xfc
	bl sub_0808B6E8
	ldr r0, _08016BBC @ =0x000005CC
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08016BA8: .4byte gUnknown_0200C078
_08016BAC: .4byte gUnknown_0200C2D0
_08016BB0: .4byte gUnknown_0200C420
_08016BB4: .4byte gUnknown_02028030
_08016BB8: .4byte gUnknown_0202FDFC
_08016BBC: .4byte 0x000005CC

