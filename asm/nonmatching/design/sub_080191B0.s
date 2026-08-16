	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080191B0
sub_080191B0: @ 0x080191B0
	push {r4, lr}
	bl sub_080198C4
	movs r0, #0
	ldr r3, _08019238 @ =gUnknown_0200C528
	movs r2, #0
_080191BC:
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	str r2, [r0]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #9
	ble _080191BC
	movs r0, #0
	ldr r3, _0801923C @ =gUnknown_0200C508
	movs r2, #0
_080191DC:
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #2
	adds r0, r0, r3
	str r2, [r0]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #7
	ble _080191DC
	bl sub_0803CB8C
	ldr r0, _08019240 @ =gUnknown_03002EF0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08019244 @ =gUnknown_03001404
	strh r1, [r0]
	bl sub_0801797C
	bl sub_080179AC
	bl sub_08017A0C
	ldr r1, _08019248 @ =gUnknown_03002F08
	movs r0, #8
	strb r0, [r1]
	ldr r0, _0801924C @ =0x0000FFFF
	strh r0, [r1, #2]
	ldr r0, _08019250 @ =gUnknown_08499588
	ldr r0, [r0]
	ldr r1, _08019254 @ =0x06006800
	movs r4, #0x80
	lsls r4, r4, #2
	adds r2, r4, #0
	bl sub_08011C68
	ldr r0, _08019258 @ =gUnknown_0849958C
	ldr r0, [r0]
	ldr r1, _0801925C @ =0x0600E000
	adds r2, r4, #0
	bl sub_08011C68
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019238: .4byte gUnknown_0200C528
_0801923C: .4byte gUnknown_0200C508
_08019240: .4byte gUnknown_03002EF0
_08019244: .4byte gUnknown_03001404
_08019248: .4byte gUnknown_03002F08
_0801924C: .4byte 0x0000FFFF
_08019250: .4byte gUnknown_08499588
_08019254: .4byte 0x06006800
_08019258: .4byte gUnknown_0849958C
_0801925C: .4byte 0x0600E000

