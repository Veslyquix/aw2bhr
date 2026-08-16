	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803678C
sub_0803678C: @ 0x0803678C
	push {r4, r5, lr}
	ldr r0, _080367A8 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x32
	bl __umodsi3
	adds r1, r0, #0
	cmp r0, #0x14
	beq _08036804
	cmp r0, #0x14
	bhi _080367AC
	cmp r0, #0
	beq _080367B2
	b _08036868
	.align 2, 0
_080367A8: .4byte gUnknown_03004008
_080367AC:
	cmp r1, #0x28
	beq _08036828
	b _08036868
_080367B2:
	ldr r4, _080367F0 @ =gUnknown_081251B0
	ldr r5, _080367F4 @ =gUnknown_030030B4
	ldr r1, [r5]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r0, _080367F8 @ =0x060067A0
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_08011C68
	adds r4, #0x20
	ldr r1, [r5]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _080367FC @ =0x060067C0
	adds r1, r1, r2
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_08011C68
	ldr r1, [r5]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r0, _08036800 @ =0x060067E0
	adds r1, r1, r0
	adds r0, r4, #0
	b _08036814
	.align 2, 0
_080367F0: .4byte gUnknown_081251B0
_080367F4: .4byte gUnknown_030030B4
_080367F8: .4byte 0x060067A0
_080367FC: .4byte 0x060067C0
_08036800: .4byte 0x060067E0
_08036804:
	ldr r0, _0803681C @ =gUnknown_081251B0
	ldr r1, _08036820 @ =gUnknown_030030B4
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _08036824 @ =0x060067E0
	adds r1, r1, r2
_08036814:
	movs r2, #0x20
	bl sub_08011C68
	b _08036868
	.align 2, 0
_0803681C: .4byte gUnknown_081251B0
_08036820: .4byte gUnknown_030030B4
_08036824: .4byte 0x060067E0
_08036828:
	ldr r5, _08036870 @ =gUnknown_08090EC4
	ldr r4, _08036874 @ =gUnknown_030030B4
	ldr r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r0, _08036878 @ =0x060067A0
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #0x20
	bl sub_08011C68
	ldr r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _0803687C @ =0x060067C0
	adds r1, r1, r2
	adds r0, r5, #0
	movs r2, #0x20
	bl sub_08011C68
	ldr r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r0, _08036880 @ =0x060067E0
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #0x20
	bl sub_08011C68
_08036868:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08036870: .4byte gUnknown_08090EC4
_08036874: .4byte gUnknown_030030B4
_08036878: .4byte 0x060067A0
_0803687C: .4byte 0x060067C0
_08036880: .4byte 0x060067E0

