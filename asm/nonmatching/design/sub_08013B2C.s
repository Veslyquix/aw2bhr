	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013B2C
sub_08013B2C: @ 0x08013B2C
	push {r4, lr}
	ldr r4, _08013BD8 @ =gUnknown_03002F00
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08013B56
	ldr r0, _08013BDC @ =gUnknown_08499578
	ldr r0, [r0]
	ldr r1, _08013BE0 @ =gUnknown_03002B6C
	ldr r1, [r1]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011C68
_08013B56:
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08013B7C
	ldr r0, _08013BE4 @ =gUnknown_0849957C
	ldr r0, [r0]
	ldr r1, _08013BE8 @ =gUnknown_03001FE8
	ldr r1, [r1]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011C68
_08013B7C:
	ldrh r1, [r4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08013BA2
	ldr r0, _08013BEC @ =gUnknown_08499580
	ldr r0, [r0]
	ldr r1, _08013BF0 @ =gUnknown_030030B4
	ldr r1, [r1]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011C68
_08013BA2:
	ldrh r1, [r4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08013BC8
	ldr r0, _08013BF4 @ =gUnknown_08499584
	ldr r0, [r0]
	ldr r1, _08013BF8 @ =gUnknown_0300251C
	ldr r1, [r1]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011C68
_08013BC8:
	movs r1, #0
	strh r1, [r4]
	ldr r0, _08013BFC @ =gUnknown_03000048
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013BD8: .4byte gUnknown_03002F00
_08013BDC: .4byte gUnknown_08499578
_08013BE0: .4byte gUnknown_03002B6C
_08013BE4: .4byte gUnknown_0849957C
_08013BE8: .4byte gUnknown_03001FE8
_08013BEC: .4byte gUnknown_08499580
_08013BF0: .4byte gUnknown_030030B4
_08013BF4: .4byte gUnknown_08499584
_08013BF8: .4byte gUnknown_0300251C
_08013BFC: .4byte gUnknown_03000048

