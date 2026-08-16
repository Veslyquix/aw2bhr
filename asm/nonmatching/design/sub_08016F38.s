	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016F38
sub_08016F38: @ 0x08016F38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _08016F58 @ =gUnknown_02000000
	mov r8, r0
	cmp r1, #0
	beq _08016F60
	ldr r1, _08016F5C @ =0x00000BAC
	add r1, r8
	movs r0, #1
	strb r0, [r1]
	b _08016F66
	.align 2, 0
_08016F58: .4byte gUnknown_02000000
_08016F5C: .4byte 0x00000BAC
_08016F60:
	ldr r0, _08017188 @ =0x00000BAC
	add r0, r8
	strb r1, [r0]
_08016F66:
	ldr r1, _0801718C @ =0x00000BA8
	add r1, r8
	ldr r0, _08017190 @ =gUnknown_03001FD4
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _08017194 @ =gUnknown_030033E4
	ldr r0, [r0]
	mov r1, r8
	str r0, [r1, #4]
	ldr r0, _08017198 @ =gUnknown_03004080
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _0801719C @ =gUnknown_030033EC
	ldrh r0, [r0]
	strh r0, [r1, #2]
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, r8
	ldr r4, _080171A0 @ =gUnknown_0808E550
	ldr r1, [r4]
	movs r2, #0x48
	bl sub_0808B6E8
	mov r1, r8
	adds r1, #8
	ldr r0, _080171A4 @ =gUnknown_03004490
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	movs r5, #0
	ldr r3, _080171A8 @ =0x00000B18
	add r3, r8
	ldr r6, _080171AC @ =gUnknown_030033F4
_08016FA6:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r2, r0, #2
	adds r2, r3, r2
	adds r1, r0, r6
	ldrb r1, [r1]
	str r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _08016FA6
	ldr r2, _080171B0 @ =0x00000B98
	add r2, r8
	ldr r0, _080171B4 @ =gUnknown_03002F08
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	movs r1, #0xba
	lsls r1, r1, #4
	add r1, r8
	ldr r0, _080171B8 @ =gUnknown_03002F20
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _080171BC @ =0x00000BA4
	add r1, r8
	ldr r0, _080171C0 @ =gUnknown_03001FF0
	ldr r0, [r0]
	str r0, [r1]
	ldr r6, _080171C4 @ =gUnknown_08499590
	ldr r2, [r6]
	ldrh r1, [r2]
	ldr r0, _080171C8 @ =0x00000BAE
	add r0, r8
	strh r1, [r0]
	ldrh r1, [r2, #2]
	movs r0, #0xbb
	lsls r0, r0, #4
	add r0, r8
	strh r1, [r0]
	ldrh r1, [r2, #4]
	ldr r0, _080171CC @ =0x00000BB2
	add r0, r8
	strh r1, [r0]
	ldrh r1, [r2, #6]
	ldr r0, _080171D0 @ =0x00000BB4
	add r0, r8
	strh r1, [r0]
	ldrh r1, [r2, #0x10]
	ldr r0, _080171D4 @ =0x00000BB6
	add r0, r8
	strh r1, [r0]
	ldr r4, [r4]
	ldrb r0, [r4, #2]
	adds r0, #0x4c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb
	bls _080170CA
	ldrb r0, [r4, #2]
	bl sub_080247A4
	movs r5, #0
	mov sl, r5
	ldr r0, [r6]
	ldrh r0, [r0]
	cmp r5, r0
	bge _080170B8
_08017032:
	movs r6, #0
	ldr r7, _080171C4 @ =gUnknown_08499590
	ldr r0, [r7]
	mov r1, sl
	lsls r1, r1, #0x10
	mov ip, r1
	ldrh r0, [r0, #2]
	cmp r6, r0
	bge _080170A2
	asrs r1, r1, #0x10
	mov sb, r1
_08017048:
	ldr r2, [r7]
	lsls r0, r6, #0x10
	asrs r4, r0, #0x10
	lsls r1, r4, #1
	ldr r3, _080171D8 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	add r0, sb
	lsls r0, r0, #1
	ldr r1, _080171DC @ =0x00000A22
	adds r2, r2, r1
	adds r2, r2, r0
	ldr r3, _080171E0 @ =gUnknown_03003F68
	ldr r1, [r3]
	adds r1, r1, r0
	ldrh r3, [r2]
	ldrh r1, [r1, #2]
	cmp r3, r1
	beq _08017092
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	lsls r0, r2, #2
	add r0, r8
	ldr r5, _080171E4 @ =0x00000BBA
	adds r1, r0, r5
	strh r3, [r1]
	ldr r3, _080171E8 @ =0x00000BB8
	adds r1, r0, r3
	mov r5, sl
	strb r5, [r1]
	ldr r1, _080171EC @ =0x00000BB9
	adds r0, r0, r1
	strb r6, [r0]
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
_08017092:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7]
	ldrh r1, [r1, #2]
	cmp r0, r1
	blt _08017048
_080170A2:
	movs r1, #0x80
	lsls r1, r1, #9
	add r1, ip
	lsrs r2, r1, #0x10
	mov sl, r2
	asrs r1, r1, #0x10
	ldr r3, _080171C4 @ =gUnknown_08499590
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r1, r0
	blt _08017032
_080170B8:
	lsls r0, r5, #0x10
	asrs r0, r0, #0xe
	add r0, r8
	ldr r4, _080171E4 @ =0x00000BBA
	adds r0, r0, r4
	ldr r1, _080171F0 @ =0x0000FFFF
	strh r1, [r0]
	bl sub_0802481C
_080170CA:
	movs r5, #0
_080170CC:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	mov r5, r8
	adds r0, r5, r1
	adds r0, #0x14
	ldr r2, _080171F4 @ =gUnknown_02023284
	adds r1, r1, r2
	movs r2, #0x3c
	bl sub_0808B6E8
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #4
	ble _080170CC
	movs r5, #0
	ldr r7, _080171F8 @ =gUnknown_02022684
	mov sl, r7
	movs r0, #0xc4
	lsls r0, r0, #1
	mov sb, r0
_080170FE:
	movs r4, #0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r2, r1, #4
	adds r1, r1, r2
	mov ip, r1
	lsls r6, r0, #6
_08017110:
	lsls r3, r4, #0x10
	asrs r3, r3, #0x10
	mov r1, ip
	adds r0, r1, r3
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	adds r2, r6, r3
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	add r1, sb
	add r0, sl
	ldm r0!, {r2, r4, r7}
	stm r1!, {r2, r4, r7}
	adds r3, #1
	lsls r3, r3, #0x10
	lsrs r4, r3, #0x10
	asrs r3, r3, #0x10
	cmp r3, #0x32
	ble _08017110
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _080170FE
	movs r5, #0
	ldr r4, _080171FC @ =0x00000D28
	add r4, r8
	ldr r6, _08017200 @ =gUnknown_02028360
_08017154:
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	lsls r0, r2, #3
	adds r3, r4, r0
	adds r0, r0, r6
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r3]
	str r1, [r3, #4]
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0xf
	ble _08017154
	ldr r0, _08017204 @ =0x00000DA8
	add r0, r8
	bl sub_08045700
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017188: .4byte 0x00000BAC
_0801718C: .4byte 0x00000BA8
_08017190: .4byte gUnknown_03001FD4
_08017194: .4byte gUnknown_030033E4
_08017198: .4byte gUnknown_03004080
_0801719C: .4byte gUnknown_030033EC
_080171A0: .4byte gUnknown_0808E550
_080171A4: .4byte gUnknown_03004490
_080171A8: .4byte 0x00000B18
_080171AC: .4byte gUnknown_030033F4
_080171B0: .4byte 0x00000B98
_080171B4: .4byte gUnknown_03002F08
_080171B8: .4byte gUnknown_03002F20
_080171BC: .4byte 0x00000BA4
_080171C0: .4byte gUnknown_03001FF0
_080171C4: .4byte gUnknown_08499590
_080171C8: .4byte 0x00000BAE
_080171CC: .4byte 0x00000BB2
_080171D0: .4byte 0x00000BB4
_080171D4: .4byte 0x00000BB6
_080171D8: .4byte 0x0000417A
_080171DC: .4byte 0x00000A22
_080171E0: .4byte gUnknown_03003F68
_080171E4: .4byte 0x00000BBA
_080171E8: .4byte 0x00000BB8
_080171EC: .4byte 0x00000BB9
_080171F0: .4byte 0x0000FFFF
_080171F4: .4byte gUnknown_02023284
_080171F8: .4byte gUnknown_02022684
_080171FC: .4byte 0x00000D28
_08017200: .4byte gUnknown_02028360
_08017204: .4byte 0x00000DA8

