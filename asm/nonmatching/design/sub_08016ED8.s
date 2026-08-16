	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016ED8
sub_08016ED8: @ 0x08016ED8
	push {r4, r5, lr}
	ldr r4, _08016F28 @ =gUnknown_02000000
	movs r0, #0
	adds r1, r4, #0
	bl sub_0801AC58
	cmp r0, #0
	bne _08016F20
	bl sub_08016EA4
	ldr r5, _08016F2C @ =gUnknown_0808E54C
	ldr r0, [r5]
	movs r1, #0x85
	lsls r1, r1, #3
	adds r3, r4, r1
	adds r2, r0, #0
	adds r2, #0x38
	movs r1, #0x29
_08016EFC:
	ldm r3!, {r0}
	stm r2!, {r0}
	subs r1, #1
	cmp r1, #0
	bge _08016EFC
	bl sub_08016E8C
	ldr r1, [r5]
	ldr r2, _08016F30 @ =0x000003F9
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r1, #9]
	ldr r0, _08016F34 @ =gUnknown_0202FDFC
	adds r2, #0xd7
	adds r1, r4, r2
	movs r2, #0xfc
	bl sub_0808B6E8
_08016F20:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08016F28: .4byte gUnknown_02000000
_08016F2C: .4byte gUnknown_0808E54C
_08016F30: .4byte 0x000003F9
_08016F34: .4byte gUnknown_0202FDFC

