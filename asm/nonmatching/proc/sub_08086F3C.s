	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08086F3C
sub_08086F3C: @ 0x08086F3C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl sub_08013C54
	ldr r0, _08086FA4 @ =gUnknown_02027F74
	adds r0, #4
	adds r4, r4, r0
	ldrb r0, [r4]
	cmp r0, #0xb3
	bhi _08086FC6
	bl sub_0803CA54
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08086FC0
	ldrb r0, [r4]
	bl sub_080247A4
	ldr r5, _08086FA8 @ =gUnknown_03001FE8
	ldr r0, [r5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	ldr r4, _08086FAC @ =0x06004000
	adds r0, r0, r4
	bl sub_0801B6EC
	ldr r0, [r5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	adds r0, r0, r4
	bl sub_0801B6FC
	ldr r0, _08086FB0 @ =gUnknown_0849957C
	ldr r0, [r0]
	movs r1, #0xc4
	lsls r1, r1, #7
	bl sub_08037A20
	ldr r1, _08086FB4 @ =gUnknown_03005918
	ldr r0, _08086FB8 @ =gUnknown_03003F68
	ldr r2, [r0]
	ldrb r0, [r2]
	str r0, [r1]
	ldr r1, _08086FBC @ =gUnknown_030058F4
	ldrb r0, [r2, #1]
	str r0, [r1]
	bl sub_0802481C
	b _0808701C
	.align 2, 0
_08086FA4: .4byte gUnknown_02027F74
_08086FA8: .4byte gUnknown_03001FE8
_08086FAC: .4byte 0x06004000
_08086FB0: .4byte gUnknown_0849957C
_08086FB4: .4byte gUnknown_03005918
_08086FB8: .4byte gUnknown_03003F68
_08086FBC: .4byte gUnknown_030058F4
_08086FC0:
	ldrb r0, [r4]
	cmp r0, #0xb3
	bls _0808701C
_08086FC6:
	ldr r0, _08087028 @ =gUnknown_0823FD7C
	ldr r1, _0808702C @ =gUnknown_03001FE8
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _08087030 @ =0x06004000
	adds r1, r1, r2
	bl Decompress
	movs r4, #0
	movs r1, #0
	ldr r0, _08087034 @ =gUnknown_0849957C
	mov ip, r0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r7, r2, #0
	movs r0, #0xc0
	lsls r0, r0, #7
	adds r6, r0, #0
_08086FEE:
	adds r5, r1, #1
	lsls r2, r1, #6
	movs r3, #9
_08086FF4:
	mov r0, ip
	ldr r1, [r0]
	adds r1, r2, r1
	adds r0, r4, r7
	orrs r0, r6
	strh r0, [r1]
	adds r4, #1
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _08086FF4
	adds r1, r5, #0
	cmp r1, #7
	ble _08086FEE
	ldr r1, _08087038 @ =gUnknown_03005918
	movs r0, #0x14
	str r0, [r1]
	ldr r1, _0808703C @ =gUnknown_030058F4
	movs r0, #0x10
	str r0, [r1]
_0808701C:
	bl sub_08013AFC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087028: .4byte gUnknown_0823FD7C
_0808702C: .4byte gUnknown_03001FE8
_08087030: .4byte 0x06004000
_08087034: .4byte gUnknown_0849957C
_08087038: .4byte gUnknown_03005918
_0808703C: .4byte gUnknown_030058F4

