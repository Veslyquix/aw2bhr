	.include "macro.inc"
	.syntax unified
    

	thumb_func_start EnsureValidTile
EnsureValidTile: @ 0x08008BB8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl sub_08008B70
	adds r7, r0, #0
	cmp r7, #0
	ble _08008C18
	ldr r0, _08008C20 @ =gUnknown_085D3DD0
	movs r1, #0xaa
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r0, _08008C24 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _08008C28 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _08008C2C @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #0x1f
	ands r2, r0
	ldr r3, _08008C30 @ =gUnknown_085D5ABC
	movs r0, #0x3f
	ands r0, r7
	movs r1, #0x5c
	muls r0, r1, r0
	adds r0, r0, r3
	ldrb r0, [r0, #0x19]
	lsls r0, r0, #5
	adds r2, r2, r0
	adds r4, r4, r2
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08008C18
	movs r0, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_08008A8C
_08008C18:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008C20: .4byte gUnknown_085D3DD0
_08008C24: .4byte gUnknown_08499590
_08008C28: .4byte 0x0000417A
_08008C2C: .4byte 0x00001432
_08008C30: .4byte gUnknown_085D5ABC

