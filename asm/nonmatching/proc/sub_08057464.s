	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057464
sub_08057464: @ 0x08057464
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _08057674 @ =gUnknown_08551A4C
	ldr r0, _08057678 @ =gUnknown_03004514
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r2, _0805767C @ =gUnknown_08551A50
	ldr r1, _08057680 @ =gUnknown_03004524
	ldrh r1, [r1]
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	ldr r2, _08057684 @ =gUnknown_08136170
	bl sub_080119A0
	ldr r1, _08057688 @ =gUnknown_08551A48
	ldr r0, _0805768C @ =gUnknown_030045AC
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r2, _08057690 @ =gUnknown_08136174
	movs r1, #0x64
	bl sub_080119A0
	movs r0, #0x10
	movs r1, #0x10
	ldr r2, _08057694 @ =gUnknown_08136178
	bl sub_080119A0
	movs r0, #0x10
	movs r1, #0x18
	ldr r2, _08057698 @ =gUnknown_08136180
	bl sub_080119A0
	movs r0, #0x10
	movs r1, #0x20
	ldr r2, _0805769C @ =gUnknown_08136188
	bl sub_080119A0
	movs r0, #0x10
	movs r1, #0x28
	ldr r2, _080576A0 @ =gUnknown_0813618C
	bl sub_080119A0
	movs r0, #0x10
	movs r1, #0x30
	ldr r2, _080576A4 @ =gUnknown_08136190
	bl sub_080119A0
	movs r0, #0x10
	movs r1, #0x38
	ldr r2, _080576A8 @ =gUnknown_08136194
	bl sub_080119A0
	movs r0, #0x10
	movs r1, #0x40
	ldr r2, _080576AC @ =gUnknown_08136198
	bl sub_080119A0
	ldr r7, _080576B0 @ =gUnknown_0813619C
	movs r0, #0x10
	movs r1, #0x48
	adds r2, r7, #0
	bl sub_080119A0
	ldr r0, _080576B4 @ =gUnknown_08551A60
	mov sl, r0
	ldr r4, _080576B8 @ =gUnknown_03004550
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	add r0, sl
	ldr r2, [r0]
	movs r0, #0x48
	movs r1, #0x10
	bl sub_080119A0
	ldr r0, _080576BC @ =gUnknown_08551A74
	mov sb, r0
	movs r1, #2
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	add r0, sb
	ldr r2, [r0]
	movs r0, #0x48
	movs r1, #0x18
	bl sub_080119A0
	ldr r0, _080576C0 @ =gUnknown_08551AD4
	mov r8, r0
	movs r1, #4
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	add r0, r8
	ldr r2, [r0]
	movs r0, #0x48
	movs r1, #0x20
	bl sub_080119A0
	ldr r6, _080576C4 @ =gUnknown_08551AE0
	movs r1, #6
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	movs r0, #0x48
	movs r1, #0x28
	bl sub_080119A0
	ldr r5, _080576C8 @ =gUnknown_08551B98
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0x48
	movs r1, #0x30
	bl sub_080119A0
	movs r0, #0xa
	ldrsh r2, [r4, r0]
	movs r0, #0x48
	movs r1, #0x38
	bl sub_08011A20
	movs r1, #0xc
	ldrsh r2, [r4, r1]
	movs r0, #0x48
	movs r1, #0x40
	bl sub_08011A20
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #0x48
	movs r1, #0x48
	bl sub_08011A20
	movs r0, #0x88
	movs r1, #0x10
	ldr r2, _08057694 @ =gUnknown_08136178
	bl sub_080119A0
	movs r0, #0x88
	movs r1, #0x18
	ldr r2, _08057698 @ =gUnknown_08136180
	bl sub_080119A0
	movs r0, #0x88
	movs r1, #0x20
	ldr r2, _0805769C @ =gUnknown_08136188
	bl sub_080119A0
	movs r0, #0x88
	movs r1, #0x28
	ldr r2, _080576A0 @ =gUnknown_0813618C
	bl sub_080119A0
	movs r0, #0x88
	movs r1, #0x30
	ldr r2, _080576A4 @ =gUnknown_08136190
	bl sub_080119A0
	movs r0, #0x88
	movs r1, #0x38
	ldr r2, _080576A8 @ =gUnknown_08136194
	bl sub_080119A0
	movs r0, #0x88
	movs r1, #0x40
	ldr r2, _080576AC @ =gUnknown_08136198
	bl sub_080119A0
	movs r0, #0x88
	movs r1, #0x48
	adds r2, r7, #0
	bl sub_080119A0
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	add r0, sl
	ldr r2, [r0]
	movs r0, #0xc0
	movs r1, #0x10
	bl sub_080119A0
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	add r0, sb
	ldr r2, [r0]
	movs r0, #0xc0
	movs r1, #0x18
	bl sub_080119A0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	add r0, r8
	ldr r2, [r0]
	movs r0, #0xc0
	movs r1, #0x20
	bl sub_080119A0
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	movs r0, #0xc0
	movs r1, #0x28
	bl sub_080119A0
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0xc0
	movs r1, #0x30
	bl sub_080119A0
	movs r0, #0x1a
	ldrsh r2, [r4, r0]
	movs r0, #0xc0
	movs r1, #0x38
	bl sub_08011A20
	movs r1, #0x1c
	ldrsh r2, [r4, r1]
	movs r0, #0xc0
	movs r1, #0x40
	bl sub_08011A20
	movs r0, #0x1e
	ldrsh r2, [r4, r0]
	movs r0, #0xc0
	movs r1, #0x48
	bl sub_08011A20
	ldr r1, _080576CC @ =gUnknown_08551B8C
	ldr r0, _080576D0 @ =gUnknown_03004540
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #0x50
	movs r1, #0x7c
	bl sub_080119A0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057674: .4byte gUnknown_08551A4C
_08057678: .4byte gUnknown_03004514
_0805767C: .4byte gUnknown_08551A50
_08057680: .4byte gUnknown_03004524
_08057684: .4byte gUnknown_08136170
_08057688: .4byte gUnknown_08551A48
_0805768C: .4byte gUnknown_030045AC
_08057690: .4byte gUnknown_08136174
_08057694: .4byte gUnknown_08136178
_08057698: .4byte gUnknown_08136180
_0805769C: .4byte gUnknown_08136188
_080576A0: .4byte gUnknown_0813618C
_080576A4: .4byte gUnknown_08136190
_080576A8: .4byte gUnknown_08136194
_080576AC: .4byte gUnknown_08136198
_080576B0: .4byte gUnknown_0813619C
_080576B4: .4byte gUnknown_08551A60
_080576B8: .4byte gUnknown_03004550
_080576BC: .4byte gUnknown_08551A74
_080576C0: .4byte gUnknown_08551AD4
_080576C4: .4byte gUnknown_08551AE0
_080576C8: .4byte gUnknown_08551B98
_080576CC: .4byte gUnknown_08551B8C
_080576D0: .4byte gUnknown_03004540

