	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080805E0
sub_080805E0: @ 0x080805E0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, _08080680 @ =gUnknown_030030E0
	ldrb r1, [r3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _08080684 @ =gUnknown_03002020
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08080688 @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	ldr r1, _0808068C @ =gUnknown_03001FFC
	ldrh r0, [r1]
	strh r0, [r1]
	ldrh r1, [r3]
	ldr r0, _08080690 @ =0x0000FFE0
	ands r0, r1
	strh r0, [r3]
	ldrb r1, [r3]
	movs r2, #0x21
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldrh r1, [r3]
	ldr r0, _08080694 @ =0x0000E0FF
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3]
	ldrb r1, [r3, #1]
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3, #1]
	ldr r1, _08080698 @ =gUnknown_030030DC
	ldrb r3, [r1]
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r1]
	ldrb r0, [r1, #1]
	ands r2, r0
	strb r2, [r1, #1]
	ldr r5, _0808069C @ =gUnknown_08610A38
	ldr r3, _080806A0 @ =gUnknown_085D3DD0
	ldr r0, _080806A4 @ =gUnknown_03005904
	ldr r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	ldr r0, _080806A8 @ =gUnknown_03005970
	ldr r1, [r0]
	lsls r0, r1, #6
	adds r0, r0, r1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, #0x38
	adds r0, r0, r3
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, _080806AC @ =gUnknown_08616750
	adds r2, r4, #0
	bl sub_0807F8FC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r4, #0x58]
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080680: .4byte gUnknown_030030E0
_08080684: .4byte gUnknown_03002020
_08080688: .4byte gUnknown_03002B28
_0808068C: .4byte gUnknown_03001FFC
_08080690: .4byte 0x0000FFE0
_08080694: .4byte 0x0000E0FF
_08080698: .4byte gUnknown_030030DC
_0808069C: .4byte gUnknown_08610A38
_080806A0: .4byte gUnknown_085D3DD0
_080806A4: .4byte gUnknown_03005904
_080806A8: .4byte gUnknown_03005970
_080806AC: .4byte gUnknown_08616750

