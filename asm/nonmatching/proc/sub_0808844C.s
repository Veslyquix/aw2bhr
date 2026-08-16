	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808844C
sub_0808844C: @ 0x0808844C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _08088538 @ =gUnknown_08616EDC
	mov r8, r0
	bl Proc_Find
	cmp r0, #0
	beq _08088468
	b _08088BF2
_08088468:
	ldr r3, _0808853C @ =gUnknown_03005908
	ldr r1, [r3]
	mov sl, r1
	cmp r1, #0
	beq _08088474
	b _080889AC
_08088474:
	adds r0, r7, #0
	adds r0, #0x4e
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r0, [sp, #4]
	movs r3, #0x4c
	adds r3, r3, r7
	mov sb, r3
	adds r5, r7, #0
	adds r5, #0x68
	cmp r1, #0
	beq _0808848E
	b _0808884A
_0808848E:
	ldr r0, [r7, #0x60]
	cmp r0, #0
	beq _08088496
	b _0808883A
_08088496:
	ldr r1, _08088540 @ =gUnknown_081D9458
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r2, [r0, #2]
	movs r0, #0x20
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	beq _08088560
	ldr r4, _08088544 @ =gUnknown_081D945C
	mov r8, r4
	ldr r5, [r4]
	adds r4, r7, #0
	adds r4, #0x52
	ldrh r0, [r4]
	ldr r1, [r7, #0x58]
	ldr r2, _08088548 @ =gUnknown_03005948
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0808854C @ =0x06014200
	movs r2, #0x16
	bl sub_08043E3C
	ldrh r0, [r4]
	adds r0, #1
	ldr r1, [r7, #0x58]
	ldr r3, _08088548 @ =gUnknown_03005948
	adds r1, r1, r3
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _08088550 @ =0x06014680
	movs r2, #0x17
	bl sub_08043E3C
	ldrh r0, [r4]
	adds r0, #2
	ldr r1, [r7, #0x58]
	ldr r2, _08088548 @ =gUnknown_03005948
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _08088554 @ =0x06014B00
	movs r2, #0x18
	bl sub_08043E3C
	mov r0, sl
	mov r3, sb
	strh r0, [r3]
	ldrh r0, [r4]
	adds r6, r4, #0
	cmp r0, #0
	bne _08088526
	ldr r0, [r7, #0x58]
	ldr r1, _08088548 @ =gUnknown_03005948
	adds r0, r0, r1
	ldrb r0, [r0]
_08088526:
	subs r0, #1
	strh r0, [r6]
	ldr r0, _08088558 @ =0x0000FFFF
	ldr r2, [sp, #4]
	strh r0, [r2]
	ldr r5, _0808855C @ =gUnknown_030058E0
	ldrh r0, [r6]
	b _08088610
	.align 2, 0
_08088538: .4byte gUnknown_08616EDC
_0808853C: .4byte gUnknown_03005908
_08088540: .4byte gUnknown_081D9458
_08088544: .4byte gUnknown_081D945C
_08088548: .4byte gUnknown_03005948
_0808854C: .4byte 0x06014200
_08088550: .4byte 0x06014680
_08088554: .4byte 0x06014B00
_08088558: .4byte 0x0000FFFF
_0808855C: .4byte gUnknown_030058E0
_08088560:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08088660
	adds r4, r7, #0
	adds r4, #0x52
	ldrh r0, [r4]
	ldr r3, _080885EC @ =gUnknown_081D9460
	ldr r5, [r3]
	ldr r1, [r7, #0x58]
	adds r1, r1, r5
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	ldr r1, _080885F0 @ =gUnknown_030058E0
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r1, _080885F4 @ =0x06014200
	movs r2, #0x16
	bl sub_08043E3C
	ldrh r0, [r4]
	adds r0, #1
	ldr r1, [r7, #0x58]
	adds r1, r1, r5
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	ldr r2, _080885F0 @ =gUnknown_030058E0
	adds r0, r0, r2
	ldrb r0, [r0]
	ldr r1, _080885F8 @ =0x06014680
	movs r2, #0x17
	bl sub_08043E3C
	ldrh r0, [r4]
	adds r0, #2
	ldr r1, [r7, #0x58]
	adds r1, r1, r5
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	ldr r3, _080885F0 @ =gUnknown_030058E0
	adds r0, r0, r3
	ldrb r0, [r0]
	ldr r1, _080885FC @ =0x06014B00
	movs r2, #0x18
	bl sub_08043E3C
	mov r1, sl
	mov r0, sb
	strh r1, [r0]
	ldrh r1, [r4]
	ldr r0, [r7, #0x58]
	adds r0, r0, r5
	ldrb r0, [r0]
	subs r0, #1
	adds r6, r4, #0
	cmp r1, r0
	bne _08088600
	mov r2, sl
	strh r2, [r6]
	b _08088604
	.align 2, 0
_080885EC: .4byte gUnknown_081D9460
_080885F0: .4byte gUnknown_030058E0
_080885F4: .4byte 0x06014200
_080885F8: .4byte 0x06014680
_080885FC: .4byte 0x06014B00
_08088600:
	adds r0, r1, #1
	strh r0, [r6]
_08088604:
	movs r0, #1
	ldr r3, [sp, #4]
	strh r0, [r3]
	ldr r5, _08088654 @ =gUnknown_030058E0
	ldrh r0, [r6]
	adds r0, #2
_08088610:
	ldr r4, _08088658 @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0808865C @ =0x06013D80
	movs r2, #0x15
	bl sub_08043E3C
	ldrh r0, [r6]
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r1, #0xb3
	lsls r1, r1, #2
	bl sub_08043B14
	movs r0, #0x67
	bl sub_0803B4DC
	adds r5, r7, #0
	adds r5, #0x68
	b _0808883A
	.align 2, 0
_08088654: .4byte gUnknown_030058E0
_08088658: .4byte gUnknown_03005948
_0808865C: .4byte 0x06013D80
_08088660:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _080886D8
	ldr r3, _080886C8 @ =gUnknown_03005944
	ldr r0, [r3]
	cmp r0, #1
	ble _080886D8
	ldr r4, _080886CC @ =gUnknown_03005978
	ldr r0, [r7, #0x58]
	adds r0, r0, r4
	adds r2, r7, #0
	adds r2, #0x52
	ldrh r1, [r2]
	strb r1, [r0]
	ldr r0, [r7, #0x58]
	adds r6, r2, #0
	cmp r0, #0
	bne _0808868A
	ldr r0, [r3]
	str r0, [r7, #0x58]
_0808868A:
	ldr r0, [r7, #0x58]
	subs r0, #1
	str r0, [r7, #0x58]
	mov r1, sl
	str r1, [r7, #0x5c]
	adds r0, r0, r4
	ldrb r0, [r0]
	strh r0, [r6]
	mov r2, sb
	strh r1, [r2]
	movs r2, #0
	ldr r3, [r7, #0x58]
	ldr r4, _080886D0 @ =gUnknown_081D9464
	mov r8, r4
	cmp sl, r3
	bge _080886BC
	ldr r4, _080886D4 @ =gUnknown_03005948
_080886AC:
	adds r0, r2, r4
	ldrb r1, [r0]
	ldr r0, [r7, #0x5c]
	adds r0, r0, r1
	str r0, [r7, #0x5c]
	adds r2, #1
	cmp r2, r3
	blt _080886AC
_080886BC:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x60]
	mov r0, r8
	ldr r1, [r0]
	b _0808874A
	.align 2, 0
_080886C8: .4byte gUnknown_03005944
_080886CC: .4byte gUnknown_03005978
_080886D0: .4byte gUnknown_081D9464
_080886D4: .4byte gUnknown_03005948
_080886D8:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08088794
	ldr r4, _08088780 @ =gUnknown_03005944
	ldr r0, [r4]
	cmp r0, #1
	ble _08088794
	ldr r5, _08088784 @ =gUnknown_03005978
	ldr r0, [r7, #0x58]
	adds r0, r0, r5
	adds r2, r7, #0
	adds r2, #0x52
	ldrh r1, [r2]
	movs r3, #0
	strb r1, [r0]
	ldr r0, [r7, #0x58]
	adds r0, #1
	str r0, [r7, #0x58]
	ldr r1, [r4]
	adds r6, r2, #0
	cmp r0, r1
	bne _0808870E
	str r3, [r7, #0x58]
_0808870E:
	str r3, [r7, #0x5c]
	ldr r0, [r7, #0x58]
	adds r0, r0, r5
	ldrb r0, [r0]
	strh r0, [r6]
	adds r0, r7, #0
	adds r0, #0x4c
	strh r3, [r0]
	movs r2, #0
	ldr r3, [r7, #0x58]
	mov sb, r0
	ldr r1, _08088788 @ =gUnknown_081D9464
	mov r8, r1
	adds r5, r7, #0
	adds r5, #0x68
	cmp r2, r3
	bge _08088742
	ldr r4, _0808878C @ =gUnknown_03005948
_08088732:
	adds r0, r2, r4
	ldrb r1, [r0]
	ldr r0, [r7, #0x5c]
	adds r0, r0, r1
	str r0, [r7, #0x5c]
	adds r2, #1
	cmp r2, r3
	blt _08088732
_08088742:
	movs r0, #1
	str r0, [r7, #0x60]
	mov r2, r8
	ldr r1, [r2]
_0808874A:
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #8
	bl sub_0802D5CC
	ldr r4, _08088790 @ =gUnknown_030058E0
	ldrh r0, [r6]
	ldr r2, _0808878C @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0xb3
	lsls r1, r1, #2
	bl sub_08043B14
	movs r0, #0x67
	bl sub_0803B4DC
	b _0808883A
	.align 2, 0
_08088780: .4byte gUnknown_03005944
_08088784: .4byte gUnknown_03005978
_08088788: .4byte gUnknown_081D9464
_0808878C: .4byte gUnknown_03005948
_08088790: .4byte gUnknown_030058E0
_08088794:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08088808
	ldr r1, _080887F4 @ =gUnknown_03005908
	movs r0, #3
	str r0, [r1]
	ldr r1, _080887F8 @ =gUnknown_03005958
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #1
	bl sub_0802D5CC
	adds r5, r7, #0
	adds r5, #0x4c
	movs r0, #0
	strh r0, [r5]
	ldr r3, _080887FC @ =gUnknown_03005964
	mov r8, r3
	ldr r4, _08088800 @ =gUnknown_030058E0
	adds r0, r7, #0
	adds r0, #0x52
	ldrh r0, [r0]
	ldr r2, _08088804 @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetLoadedCoPalette
	mov r4, r8
	strb r0, [r4]
	movs r0, #0x71
	bl sub_0803B4DC
	mov sb, r5
	adds r5, #0x1c
	b _0808883A
	.align 2, 0
_080887F4: .4byte gUnknown_03005908
_080887F8: .4byte gUnknown_03005958
_080887FC: .4byte gUnknown_03005964
_08088800: .4byte gUnknown_030058E0
_08088804: .4byte gUnknown_03005948
_08088808:
	movs r0, #2
	ands r0, r1
	movs r1, #0x4c
	adds r1, r1, r7
	mov sb, r1
	adds r5, r7, #0
	adds r5, #0x68
	cmp r0, #0
	beq _0808883A
	ldr r1, _08088850 @ =gUnknown_03005908
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1]
	ldr r0, _08088854 @ =gUnknown_08616E64
	movs r1, #3
	bl Proc_Start
	adds r1, r7, #0
	adds r1, #0x64
	ldrh r1, [r1]
	adds r0, #0x64
	strh r1, [r0]
	movs r0, #0x66
	bl sub_0803B4DC
_0808883A:
	ldr r2, [sp, #4]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _0808884A
	ldr r0, [r7, #0x60]
	cmp r0, #0
	beq _08088858
_0808884A:
	movs r0, #0
	strh r0, [r5]
	b _08088872
	.align 2, 0
_08088850: .4byte gUnknown_03005908
_08088854: .4byte gUnknown_08616E64
_08088858:
	ldrh r1, [r5]
	movs r4, #0
	ldrsh r0, [r5, r4]
	cmp r0, #3
	bgt _08088868
	adds r0, r1, #1
	strh r0, [r5]
	b _08088872
_08088868:
	adds r1, r7, #0
	adds r1, #0x48
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08088872:
	ldr r1, [sp, #4]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0808892E
	mov r3, sb
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, #7
	bgt _080888C4
	adds r3, r0, #0
	movs r4, #8
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x78
	bl Interpolate
	str r0, [r7, #0x34]
	mov r1, sb
	movs r2, #0
	ldrsh r3, [r1, r2]
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0xc
	bl Interpolate
	ldr r3, [sp, #4]
	movs r2, #0
	ldrsh r1, [r3, r2]
	muls r0, r1, r0
	str r0, [r7, #0x38]
	mov r0, sb
	movs r1, #0
	ldrsh r3, [r0, r1]
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0xf
	b _0808890A
_080888C4:
	mov r4, sb
	movs r0, #0
	ldrsh r3, [r4, r0]
	subs r3, #8
	movs r4, #8
	str r4, [sp]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0
	bl Interpolate
	str r0, [r7, #0x34]
	mov r1, sb
	movs r2, #0
	ldrsh r3, [r1, r2]
	subs r3, #8
	str r4, [sp]
	movs r0, #4
	movs r1, #0xc
	movs r2, #0x18
	bl Interpolate
	ldr r3, [sp, #4]
	movs r2, #0
	ldrsh r1, [r3, r2]
	muls r0, r1, r0
	str r0, [r7, #0x38]
	mov r0, sb
	movs r1, #0
	ldrsh r3, [r0, r1]
	subs r3, #8
	str r4, [sp]
	movs r0, #4
	movs r1, #0xf
	movs r2, #0x1d
_0808890A:
	bl Interpolate
	ldr r2, [sp, #4]
	movs r3, #0
	ldrsh r1, [r2, r3]
	muls r0, r1, r0
	str r0, [r7, #0x2c]
	adds r0, r7, #0
	bl sub_08088CDC
	mov r4, sb
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x10
	bne _0808892E
	movs r0, #0
	ldr r2, [sp, #4]
	strh r0, [r2]
_0808892E:
	ldr r0, [r7, #0x60]
	cmp r0, #0
	bne _08088936
	b _08088BF2
_08088936:
	mov r5, sb
	movs r3, #0
	ldrsh r0, [r5, r3]
	cmp r0, #0xb
	bgt _08088960
	adds r3, r0, #0
	movs r4, #0xc
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x78
	bl Interpolate
	str r0, [r7, #0x34]
	movs r0, #0
	ldrsh r3, [r5, r0]
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x80
	b _08088988
_08088960:
	mov r1, sb
	movs r2, #0
	ldrsh r3, [r1, r2]
	subs r3, #0xc
	movs r4, #0xc
	str r4, [sp]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0
	bl Interpolate
	str r0, [r7, #0x34]
	mov r0, sb
	movs r1, #0
	ldrsh r3, [r0, r1]
	subs r3, #0xc
	str r4, [sp]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0xff
_08088988:
	bl Interpolate
	ldr r1, [r7, #0x60]
	muls r0, r1, r0
	str r0, [r7, #0x30]
	adds r0, r7, #0
	bl sub_08088DA4
	adds r0, r7, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x18
	beq _080889A6
	b _08088BF2
_080889A6:
	movs r0, #0
	str r0, [r7, #0x60]
	b _08088BF2
_080889AC:
	mov r4, sl
	cmp r4, #1
	beq _080889B4
	b _08088B58
_080889B4:
	ldr r0, _080889D8 @ =gpKeySt
	ldr r2, [r0]
	ldrh r1, [r2, #2]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _08088A10
	ldr r0, _080889DC @ =gUnknown_081D9468
	ldr r3, [r0]
	ldrb r2, [r3]
	adds r5, r0, #0
	cmp r2, #0
	bne _080889E0
	movs r0, #7
	b _080889E2
	.align 2, 0
_080889D8: .4byte gpKeySt
_080889DC: .4byte gUnknown_081D9468
_080889E0:
	subs r0, r2, #1
_080889E2:
	strb r0, [r3]
	ldr r4, _08088A08 @ =gUnknown_030058E0
	adds r0, r7, #0
	adds r0, #0x52
	ldrh r0, [r0]
	ldr r2, _08088A0C @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, [r5]
	ldrb r2, [r1]
	b _08088AB0
	.align 2, 0
_08088A08: .4byte gUnknown_030058E0
_08088A0C: .4byte gUnknown_03005948
_08088A10:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08088A5C
	ldr r0, _08088A28 @ =gUnknown_081D9468
	ldr r3, [r0]
	ldrb r2, [r3]
	adds r5, r0, #0
	cmp r2, #7
	bne _08088A2C
	strb r4, [r3]
	b _08088A30
	.align 2, 0
_08088A28: .4byte gUnknown_081D9468
_08088A2C:
	adds r0, r2, #1
	strb r0, [r3]
_08088A30:
	ldr r4, _08088A54 @ =gUnknown_030058E0
	adds r0, r7, #0
	adds r0, #0x52
	ldrh r0, [r0]
	ldr r2, _08088A58 @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, [r5]
	ldrb r2, [r1]
	b _08088AB0
	.align 2, 0
_08088A54: .4byte gUnknown_030058E0
_08088A58: .4byte gUnknown_03005948
_08088A5C:
	ldrh r1, [r2, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08088A78
	ldr r5, _08088A74 @ =gUnknown_03005964
	ldrb r0, [r5]
	cmp r0, #3
	bhi _08088A70
	b _08088BF2
_08088A70:
	subs r0, #4
	b _08088A90
	.align 2, 0
_08088A74: .4byte gUnknown_03005964
_08088A78:
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _08088ACC
	ldr r5, _08088AC0 @ =gUnknown_03005964
	ldrb r0, [r5]
	cmp r0, #3
	bls _08088A8E
	b _08088BF2
_08088A8E:
	adds r0, #4
_08088A90:
	strb r0, [r5]
	ldr r4, _08088AC4 @ =gUnknown_030058E0
	adds r0, r7, #0
	adds r0, #0x52
	ldrh r0, [r0]
	ldr r2, _08088AC8 @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ldrb r2, [r5]
_08088AB0:
	movs r1, #0x11
	bl sub_08043AC0
	movs r0, #0x64
	bl sub_0803B4DC
	b _08088BF2
	.align 2, 0
_08088AC0: .4byte gUnknown_03005964
_08088AC4: .4byte gUnknown_030058E0
_08088AC8: .4byte gUnknown_03005948
_08088ACC:
	mov r0, sl
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r0, #0
	beq _08088AEC
	movs r0, #5
	str r0, [r3]
	adds r0, r7, #0
	adds r0, #0x4c
	strh r2, [r0]
	movs r0, #0x71
	bl sub_0803B4DC
	b _08088BF2
_08088AEC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08088AF6
	b _08088BF2
_08088AF6:
	movs r0, #4
	str r0, [r3]
	ldr r1, _08088B50 @ =gUnknown_030058E0
	mov sl, r1
	movs r2, #0x52
	adds r2, r2, r7
	mov r8, r2
	ldrh r0, [r2]
	ldr r4, _08088B54 @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	add r0, sl
	ldrb r5, [r0]
	mov r3, r8
	ldrh r0, [r3]
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	add r0, sl
	ldrb r0, [r0]
	bl GetLoadedCoPalette
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0x11
	bl sub_08043AC0
	adds r0, r7, #0
	adds r0, #0x4c
	mov r4, sb
	strh r4, [r0]
	movs r0, #0x66
	bl sub_0803B4DC
	b _08088BF2
	.align 2, 0
_08088B50: .4byte gUnknown_030058E0
_08088B54: .4byte gUnknown_03005948
_08088B58:
	mov r0, sl
	cmp r0, #2
	bne _08088BF2
	ldr r0, _08088BC4 @ =gpKeySt
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	movs r2, #1
	adds r1, r2, #0
	ands r1, r0
	cmp r1, #0
	beq _08088BD8
	adds r0, r7, #0
	adds r0, #0x64
	strh r2, [r0]
	movs r0, #0x71
	bl sub_0803B4DC
	ldr r5, _08088BC8 @ =gUnknown_030058E0
	adds r6, r7, #0
	adds r6, #0x52
	ldrh r0, [r6]
	ldr r4, _08088BCC @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _08088BD0 @ =gUnknown_03005964
	ldrb r1, [r1]
	bl SetLoadedCoPalette
	ldrh r0, [r6]
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _08088BD4 @ =0x06013000
	movs r2, #0x12
	bl sub_08043E3C
	mov r0, r8
	adds r1, r7, #0
	bl Proc_Start
	b _08088BF2
	.align 2, 0
_08088BC4: .4byte gpKeySt
_08088BC8: .4byte gUnknown_030058E0
_08088BCC: .4byte gUnknown_03005948
_08088BD0: .4byte gUnknown_03005964
_08088BD4: .4byte 0x06013000
_08088BD8:
	mov r2, sl
	ands r2, r0
	lsls r0, r2, #0x10
	cmp r0, #0
	beq _08088BF2
	movs r0, #6
	str r0, [r3]
	adds r0, r7, #0
	adds r0, #0x4c
	strh r1, [r0]
	movs r0, #0x66
	bl sub_0803B4DC
_08088BF2:
	adds r1, r7, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, _08088C10 @ =gUnknown_03005908
	ldr r1, [r0]
	adds r0, r1, #1
	cmp r0, #1
	bhi _08088C14
	adds r0, r7, #0
	bl sub_08088ECC
	b _08088C62
	.align 2, 0
_08088C10: .4byte gUnknown_03005908
_08088C14:
	cmp r1, #1
	bne _08088C20
	adds r0, r7, #0
	bl sub_08089464
	b _08088C62
_08088C20:
	cmp r1, #2
	beq _08088C2C
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08088C34
_08088C2C:
	adds r0, r7, #0
	bl sub_080895E4
	b _08088C62
_08088C34:
	cmp r1, #3
	bne _08088C40
	adds r0, r7, #0
	bl sub_080897C8
	b _08088C62
_08088C40:
	cmp r1, #4
	bne _08088C4C
	adds r0, r7, #0
	bl sub_08089A04
	b _08088C62
_08088C4C:
	cmp r1, #5
	bne _08088C58
	adds r0, r7, #0
	bl sub_08089C14
	b _08088C62
_08088C58:
	cmp r1, #6
	bne _08088C62
	adds r0, r7, #0
	bl sub_08089F90
_08088C62:
	ldr r4, _08088CD0 @ =gUnknown_03005908
	ldr r0, [r4]
	adds r0, #1
	cmp r0, #1
	bls _08088C72
	adds r0, r7, #0
	bl sub_0808A2F4
_08088C72:
	ldr r0, [r7, #0x3c]
	subs r2, r0, #1
	str r2, [r7, #0x3c]
	ldr r1, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08088CC0
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	lsls r0, r0, #1
	ldr r1, _08088CD4 @ =gUnknown_08234AF0
	adds r0, r0, r1
	movs r1, #0x86
	lsls r1, r1, #2
	movs r2, #2
	bl ApplyPaletteExt
	ldrh r0, [r7, #0x3c]
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	lsls r0, r0, #1
	ldr r1, _08088CD8 @ =gUnknown_08239F84
	adds r0, r0, r1
	movs r1, #0xe6
	lsls r1, r1, #2
	movs r2, #2
	bl ApplyPaletteExt
_08088CC0:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088CD0: .4byte gUnknown_03005908
_08088CD4: .4byte gUnknown_08234AF0
_08088CD8: .4byte gUnknown_08239F84

