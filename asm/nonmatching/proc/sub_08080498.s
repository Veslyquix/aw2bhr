	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080498
sub_08080498: @ 0x08080498
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	bl sub_0807898C
	bl sub_08013AEC
	bl sub_08013AFC
	bl sub_08013B0C
	ldr r0, _08080590 @ =gUnknown_08236294
	ldr r1, _08080594 @ =gUnknown_0300251C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_08011CAC
	ldr r0, _08080598 @ =gUnknown_08235D30
	ldr r1, _0808059C @ =gUnknown_08499584
	ldr r1, [r1]
	bl sub_08011CAC
	ldr r0, _080805A0 @ =gUnknown_082391E8
	movs r1, #0
	movs r2, #0x20
	bl sub_08013618
	bl sub_08013B1C
	ldr r2, _080805A4 @ =gUnknown_030030CC
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _080805A8 @ =gUnknown_080A29A4
	ldr r1, _080805AC @ =gUnknown_03002B6C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _080805B0 @ =0x06005600
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011E54
	ldr r0, _080805B4 @ =gUnknown_08499578
	ldr r0, [r0]
	ldr r1, _080805B8 @ =gUnknown_080A31A4
	ldr r2, _080805BC @ =0x000082B0
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_08012B70
	ldr r0, _080805C0 @ =gUnknown_080A36C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r5, #0
	movs r2, #0x20
	bl sub_08013618
	bl sub_08013AEC
	ldr r0, _080805C4 @ =gUnknown_03005970
	ldr r0, [r0]
	movs r1, #0xe5
	lsls r1, r1, #1
	movs r2, #1
	bl sub_08043BA4
	ldr r0, _080805C8 @ =gUnknown_08239228
	ldr r4, _080805CC @ =gUnknown_0200FC50
	adds r1, r4, #0
	bl sub_08011CAC
	ldr r1, _080805D0 @ =0x06017740
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _080805D4 @ =gUnknown_08239DE4
	movs r4, #0x80
	lsls r4, r4, #2
	adds r1, r4, #0
	movs r2, #0x20
	bl sub_08013618
	adds r1, r6, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080805D8 @ =gUnknown_086168BC
	adds r1, r6, #0
	bl Proc_Start
	movs r2, #0xc0
	lsls r2, r2, #1
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r3, r5, #0
	bl sub_08073574
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080590: .4byte gUnknown_08236294
_08080594: .4byte gUnknown_0300251C
_08080598: .4byte gUnknown_08235D30
_0808059C: .4byte gUnknown_08499584
_080805A0: .4byte gUnknown_082391E8
_080805A4: .4byte gUnknown_030030CC
_080805A8: .4byte gUnknown_080A29A4
_080805AC: .4byte gUnknown_03002B6C
_080805B0: .4byte 0x06005600
_080805B4: .4byte gUnknown_08499578
_080805B8: .4byte gUnknown_080A31A4
_080805BC: .4byte 0x000082B0
_080805C0: .4byte gUnknown_080A36C8
_080805C4: .4byte gUnknown_03005970
_080805C8: .4byte gUnknown_08239228
_080805CC: .4byte gUnknown_0200FC50
_080805D0: .4byte 0x06017740
_080805D4: .4byte gUnknown_08239DE4
_080805D8: .4byte gUnknown_086168BC

