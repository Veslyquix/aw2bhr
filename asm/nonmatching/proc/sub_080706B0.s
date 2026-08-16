	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080706B0
sub_080706B0: @ 0x080706B0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08070778 @ =0x04000084
	movs r0, #0x8f
	strh r0, [r1]
	ldr r3, _0807077C @ =0x04000080
	movs r2, #0
	strh r2, [r3]
	ldr r0, _08070780 @ =0x04000063
	movs r1, #8
	strb r1, [r0]
	adds r0, #6
	strb r1, [r0]
	adds r0, #0x10
	strb r1, [r0]
	subs r0, #0x14
	movs r1, #0x80
	strb r1, [r0]
	adds r0, #8
	strb r1, [r0]
	adds r0, #0x10
	strb r1, [r0]
	subs r0, #0xd
	strb r2, [r0]
	movs r0, #0x77
	strb r0, [r3]
	ldr r0, _08070784 @ =gUnknown_03007FF0
	ldr r4, [r0]
	ldr r6, [r4]
	ldr r0, _08070788 @ =0x68736D53
	cmp r6, r0
	bne _08070770
	adds r0, r6, #1
	str r0, [r4]
	ldr r1, _0807078C @ =gUnknown_03005740
	ldr r0, _08070790 @ =sub_0807166C
	str r0, [r1, #0x20]
	ldr r0, _08070794 @ =sub_08070328
	str r0, [r1, #0x44]
	ldr r0, _08070798 @ =sub_0807033C
	str r0, [r1, #0x4c]
	ldr r0, _0807079C @ =sub_080717C4
	str r0, [r1, #0x70]
	ldr r0, _080707A0 @ =sub_080702C0
	str r0, [r1, #0x74]
	ldr r0, _080707A4 @ =sub_080708EC
	str r0, [r1, #0x78]
	ldr r0, _080707A8 @ =sub_0807004C
	str r0, [r1, #0x7c]
	adds r2, r1, #0
	adds r2, #0x80
	ldr r0, _080707AC @ =sub_08070CD0
	str r0, [r2]
	adds r1, #0x84
	ldr r0, _080707B0 @ =sub_08070D98
	str r0, [r1]
	str r5, [r4, #0x1c]
	ldr r0, _080707B4 @ =sub_08070FAC
	str r0, [r4, #0x28]
	ldr r0, _080707B8 @ =sub_08070EF4
	str r0, [r4, #0x2c]
	ldr r0, _080707BC @ =sub_08070E4C
	str r0, [r4, #0x30]
	ldr r0, _080707C0 @ =0x00000000
	movs r1, #0
	strb r0, [r4, #0xc]
	str r1, [sp]
	ldr r2, _080707C4 @ =0x05000040
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	movs r0, #1
	strb r0, [r5, #1]
	movs r0, #0x11
	strb r0, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x41
	movs r0, #2
	strb r0, [r1]
	adds r1, #0x1b
	movs r0, #0x22
	strb r0, [r1]
	adds r1, #0x25
	movs r0, #3
	strb r0, [r1]
	adds r1, #0x1b
	movs r0, #0x44
	strb r0, [r1]
	adds r1, #0x24
	movs r0, #4
	strb r0, [r1, #1]
	movs r0, #0x88
	strb r0, [r1, #0x1c]
	str r6, [r4]
_08070770:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070778: .4byte 0x04000084
_0807077C: .4byte 0x04000080
_08070780: .4byte 0x04000063
_08070784: .4byte gUnknown_03007FF0
_08070788: .4byte 0x68736D53
_0807078C: .4byte gUnknown_03005740
_08070790: .4byte sub_0807166C
_08070794: .4byte sub_08070328
_08070798: .4byte sub_0807033C
_0807079C: .4byte sub_080717C4
_080707A0: .4byte sub_080702C0
_080707A4: .4byte sub_080708EC
_080707A8: .4byte sub_0807004C
_080707AC: .4byte sub_08070CD0
_080707B0: .4byte sub_08070D98
_080707B4: .4byte sub_08070FAC
_080707B8: .4byte sub_08070EF4
_080707BC: .4byte sub_08070E4C
_080707C0: .4byte 0x00000000
_080707C4: .4byte 0x05000040

