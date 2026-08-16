	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08081D30
sub_08081D30: @ 0x08081D30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	adds r2, r7, #0
	adds r2, #0x4e
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _08081DA4
	adds r0, r7, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r6, r7, #0
	adds r6, #0x4c
	cmp r0, #0
	bne _08081D94
	adds r0, r7, #0
	adds r0, #0x68
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _08081D94
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0x1b
	ble _08081D94
	ldr r0, _08081DFC @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08081D94
	mov r3, sp
	ldrh r3, [r3, #4]
	strh r3, [r2]
	movs r1, #0
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r2, #1
	str r2, [sp, #4]
_08081D94:
	adds r1, r7, #0
	adds r1, #0x4e
	movs r3, #0
	ldrsh r0, [r1, r3]
	mov sl, r1
	cmp r0, #0
	beq _08081DA4
	b _08082476
_08081DA4:
	adds r0, r7, #0
	adds r0, #0x6a
	str r0, [sp, #8]
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0x4e
	adds r2, r2, r7
	mov sl, r2
	adds r6, r7, #0
	adds r6, #0x4c
	cmp r0, #0
	beq _08081DBE
	b _08082476
_08081DBE:
	ldr r0, _08081E00 @ =gUnknown_084892C4
	bl Proc_Find
	cmp r0, #0
	beq _08081DCA
	b _08082476
_08081DCA:
	adds r3, r7, #0
	adds r3, #0x64
	str r3, [sp, #0xc]
	movs r1, #0
	ldrsh r0, [r3, r1]
	mov r8, r0
	cmp r0, #0
	beq _08081DDC
	b _08082044
_08081DDC:
	ldr r2, _08081DFC @ =gpKeySt
	ldr r3, [r2]
	ldrh r2, [r3, #2]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08081E1A
	adds r1, r7, #0
	adds r1, #0x52
	ldrh r0, [r1]
	cmp r0, #5
	bne _08081E04
	mov r3, r8
	strh r3, [r1]
	b _08081E08
	.align 2, 0
_08081DFC: .4byte gpKeySt
_08081E00: .4byte gUnknown_084892C4
_08081E04:
	adds r0, #1
	strh r0, [r1]
_08081E08:
	adds r5, r7, #0
	adds r5, #0x4c
	movs r4, #0
	strh r4, [r5]
	adds r6, r7, #0
	adds r6, #0x4e
	ldrh r0, [r6]
	subs r0, #1
	b _08081E44
_08081E1A:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08081E5C
	adds r1, r7, #0
	adds r1, #0x52
	ldrh r0, [r1]
	cmp r0, #0
	bne _08081E30
	movs r0, #5
	b _08081E32
_08081E30:
	subs r0, #1
_08081E32:
	strh r0, [r1]
	adds r5, r7, #0
	adds r5, #0x4c
	movs r4, #0
	strh r4, [r5]
	adds r6, r7, #0
	adds r6, #0x4e
	ldrh r0, [r6]
	adds r0, #1
_08081E44:
	strh r0, [r6]
	movs r0, #0x67
	bl sub_0803B4DC
	ldr r0, _08081E58 @ =gUnknown_03005920
	str r4, [r0]
	mov sl, r6
	adds r6, r5, #0
	b _080823D2
	.align 2, 0
_08081E58: .4byte gUnknown_03005920
_08081E5C:
	ldrh r1, [r3, #4]
	movs r0, #0x11
	ands r0, r1
	cmp r0, #0
	bne _08081E68
	b _08081FEE
_08081E68:
	ldr r5, _08081ECC @ =gUnknown_081D93AC
	adds r4, r7, #0
	adds r4, #0x52
	ldrh r0, [r4]
	adds r0, #2
	movs r1, #6
	bl DivRem
	ldr r1, _08081ED0 @ =gUnknown_0861696C
	adds r0, r0, r1
	ldrb r0, [r0]
	mov sb, r4
	cmp r0, #2
	beq _08081E98
	ldrh r0, [r4]
	adds r0, #2
	movs r1, #6
	bl DivRem
	ldr r2, _08081ED0 @ =gUnknown_0861696C
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #4
	bne _08081F2C
_08081E98:
	ldr r3, _08081ED4 @ =gpKeySt
	ldr r0, [r3]
	ldrh r1, [r0, #4]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08081EAA
	b _080823D2
_08081EAA:
	ldr r0, [sp, #8]
	strh r2, [r0]
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #2
	movs r1, #6
	bl DivRem
	ldr r2, _08081ED0 @ =gUnknown_0861696C
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #2
	bne _08081EDC
	ldr r1, _08081ED8 @ =gUnknown_030033FC
	movs r0, #6
	b _08081EF6
	.align 2, 0
_08081ECC: .4byte gUnknown_081D93AC
_08081ED0: .4byte gUnknown_0861696C
_08081ED4: .4byte gpKeySt
_08081ED8: .4byte gUnknown_030033FC
_08081EDC:
	mov r3, sb
	ldrh r0, [r3]
	adds r0, #2
	movs r1, #6
	bl DivRem
	ldr r1, _08081F1C @ =gUnknown_0861696C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #4
	bne _08081EF8
	ldr r1, _08081F20 @ =gUnknown_030033FC
	movs r0, #9
_08081EF6:
	str r0, [r1]
_08081EF8:
	ldr r0, _08081F24 @ =gUnknown_03005934
	mov r2, sb
	ldrh r1, [r2]
	str r1, [r0]
	movs r0, #0x71
	bl sub_0803B4DC
	ldr r0, _08081F28 @ =gUnknown_08616A68
	adds r1, r7, #0
	bl Proc_Start
	bl sub_0803BD54
	movs r3, #0x4e
	adds r3, r3, r7
	mov sl, r3
	b _0808237C
	.align 2, 0
_08081F1C: .4byte gUnknown_0861696C
_08081F20: .4byte gUnknown_030033FC
_08081F24: .4byte gUnknown_03005934
_08081F28: .4byte gUnknown_08616A68
_08081F2C:
	movs r1, #1
	ldr r0, [sp, #0xc]
	strh r1, [r0]
	adds r4, r7, #0
	adds r4, #0x66
	movs r0, #6
	strh r0, [r4]
	adds r0, r7, #0
	adds r0, #0x68
	strh r1, [r0]
	mov r1, r8
	strh r1, [r6]
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	mov r3, sb
	ldrh r0, [r3]
	adds r0, #2
	movs r1, #6
	bl DivRem
	ldr r1, _08081FD4 @ =gUnknown_0861696C
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r8, r4
	cmp r0, #0
	bne _08081F72
	bl sub_0803BC7C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081F72
	movs r0, #7
	strh r0, [r4]
_08081F72:
	ldr r4, [r5]
	mov r2, sb
	ldrh r0, [r2]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #1
	bne _08081F98
	bl sub_0803BC88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081F98
	movs r0, #7
	mov r3, r8
	strh r0, [r3]
_08081F98:
	ldr r4, [r5]
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #5
	bne _08081FBE
	bl sub_0803BC94
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081FBE
	movs r0, #7
	mov r2, r8
	strh r0, [r2]
_08081FBE:
	ldr r0, _08081FD8 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08081FDC
	movs r0, #0x71
	bl sub_0803B4DC
	b _080823D2
	.align 2, 0
_08081FD4: .4byte gUnknown_0861696C
_08081FD8: .4byte gpKeySt
_08081FDC:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08081FE6
	b _080823D2
_08081FE6:
	movs r0, #0x67
	bl sub_0803B4DC
	b _080823D2
_08081FEE:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08081FF8
	b _080823D2
_08081FF8:
	ldr r0, _08082030 @ =0x0000FFFF
	ldr r3, [sp, #8]
	strh r0, [r3]
	ldr r1, _08082034 @ =gUnknown_030033FC
	movs r0, #0xd
	str r0, [r1]
	ldr r1, _08082038 @ =gUnknown_03005934
	adds r0, r7, #0
	adds r0, #0x52
	ldrh r0, [r0]
	str r0, [r1]
	ldr r1, _0808203C @ =gUnknown_03005924
	adds r0, r7, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [r1]
	ldr r0, _08082040 @ =gUnknown_08616A68
	adds r1, r7, #0
	bl Proc_Start
	movs r0, #0x66
	bl sub_0803B4DC
	bl sub_0803BD60
	b _080823D2
	.align 2, 0
_08082030: .4byte 0x0000FFFF
_08082034: .4byte gUnknown_030033FC
_08082038: .4byte gUnknown_03005934
_0808203C: .4byte gUnknown_03005924
_08082040: .4byte gUnknown_08616A68
_08082044:
	mov r3, r8
	cmp r3, #0
	bgt _0808204C
	b _080823D2
_0808204C:
	ldr r0, _08082074 @ =gpKeySt
	ldr r3, [r0]
	ldrh r1, [r3, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08082120
	adds r0, r7, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	mov r8, r0
	cmp r1, #6
	bne _08082078
	movs r0, #0xb
	mov r1, r8
	strh r0, [r1]
	b _0808207E
	.align 2, 0
_08082074: .4byte gpKeySt
_08082078:
	subs r0, r2, #1
	mov r2, r8
	strh r0, [r2]
_0808207E:
	ldr r5, _080820AC @ =gUnknown_081D93AC
	ldr r6, [r5]
	adds r4, r7, #0
	adds r4, #0x52
	ldrh r0, [r4]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r0, [r0]
	mov sb, r4
	cmp r0, #0
	bne _080820B0
	bl sub_0803BC7C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080820B0
	movs r0, #7
	mov r3, r8
	strh r0, [r3]
	b _08082376
	.align 2, 0
_080820AC: .4byte gUnknown_081D93AC
_080820B0:
	ldr r4, [r5]
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #1
	bne _080820DE
	bl sub_0803BC88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080820DE
	movs r0, #7
	mov r2, r8
	strh r0, [r2]
	movs r3, #0x4e
	adds r3, r3, r7
	mov sl, r3
	b _0808237C
_080820DE:
	ldr r4, [r5]
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #5
	bne _0808210C
	bl sub_0803BC94
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808210C
	movs r0, #7
	mov r2, r8
	strh r0, [r2]
	movs r3, #0x4e
	adds r3, r3, r7
	mov sl, r3
	b _0808237C
_0808210C:
	movs r0, #0x67
	bl sub_0803B4DC
	ldr r1, _0808211C @ =gUnknown_03005920
	movs r0, #0
	str r0, [r1]
	b _08082376
	.align 2, 0
_0808211C: .4byte gUnknown_03005920
_08082120:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080821E8
	adds r0, r7, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	mov r8, r0
	cmp r1, #0xb
	bne _08082140
	movs r0, #6
	mov r1, r8
	strh r0, [r1]
	b _08082146
_08082140:
	adds r0, r2, #1
	mov r2, r8
	strh r0, [r2]
_08082146:
	ldr r5, _08082174 @ =gUnknown_081D93AC
	ldr r6, [r5]
	adds r4, r7, #0
	adds r4, #0x52
	ldrh r0, [r4]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r0, [r0]
	mov sb, r4
	cmp r0, #0
	bne _08082178
	bl sub_0803BC7C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08082178
	movs r0, #7
	mov r3, r8
	strh r0, [r3]
	b _08082376
	.align 2, 0
_08082174: .4byte gUnknown_081D93AC
_08082178:
	ldr r4, [r5]
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #1
	bne _080821A6
	bl sub_0803BC88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080821A6
	movs r0, #7
	mov r2, r8
	strh r0, [r2]
	movs r3, #0x4e
	adds r3, r3, r7
	mov sl, r3
	b _0808237C
_080821A6:
	ldr r4, [r5]
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #5
	bne _080821D4
	bl sub_0803BC94
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080821D4
	movs r0, #7
	mov r2, r8
	strh r0, [r2]
	movs r3, #0x4e
	adds r3, r3, r7
	mov sl, r3
	b _0808237C
_080821D4:
	movs r0, #0x67
	bl sub_0803B4DC
	ldr r1, _080821E4 @ =gUnknown_03005920
	movs r0, #0
	str r0, [r1]
	b _08082376
	.align 2, 0
_080821E4: .4byte gUnknown_03005920
_080821E8:
	movs r0, #1
	adds r2, r0, #0
	ands r2, r1
	cmp r2, #0
	bne _080821F4
	b _08082394
_080821F4:
	ldr r1, [sp, #8]
	strh r0, [r1]
	ldr r6, _0808222C @ =gUnknown_0861696C
	adds r4, r7, #0
	adds r4, #0x52
	ldrh r0, [r4]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r0, [r0]
	mov sb, r4
	cmp r0, #0
	bne _08082258
	adds r4, #0x14
	movs r2, #0
	ldrsh r0, [r4, r2]
	movs r1, #2
	bl DivRem
	adds r1, r0, #0
	mov r8, r4
	cmp r1, #0
	bne _08082234
	ldr r0, _08082230 @ =gUnknown_030033FC
	str r1, [r0]
	b _08082352
	.align 2, 0
_0808222C: .4byte gUnknown_0861696C
_08082230: .4byte gUnknown_030033FC
_08082234:
	mov r3, r8
	movs r1, #0
	ldrsh r0, [r3, r1]
	movs r1, #2
	bl DivRem
	adds r1, r0, #0
	cmp r1, #1
	beq _08082248
	b _08082352
_08082248:
	ldr r0, _08082254 @ =gUnknown_030033FC
	str r1, [r0]
	bl sub_0803BC7C
	b _080822F8
	.align 2, 0
_08082254: .4byte gUnknown_030033FC
_08082258:
	mov r2, sb
	ldrh r0, [r2]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #1
	bne _080822AC
	adds r4, r7, #0
	adds r4, #0x66
	movs r3, #0
	ldrsh r0, [r4, r3]
	movs r1, #2
	bl DivRem
	mov r8, r4
	cmp r0, #0
	bne _0808228C
	ldr r1, _08082288 @ =gUnknown_030033FC
	movs r0, #2
	b _08082350
	.align 2, 0
_08082288: .4byte gUnknown_030033FC
_0808228C:
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #2
	bl DivRem
	cmp r0, #1
	bne _08082352
	ldr r1, _080822A8 @ =gUnknown_030033FC
	movs r0, #3
	str r0, [r1]
	bl sub_0803BC88
	b _080822F8
	.align 2, 0
_080822A8: .4byte gUnknown_030033FC
_080822AC:
	mov r3, sb
	ldrh r0, [r3]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r5, [r0]
	cmp r5, #5
	bne _08082308
	adds r4, r7, #0
	adds r4, #0x66
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #2
	bl DivRem
	mov r8, r4
	cmp r0, #0
	bne _080822E0
	ldr r1, _080822DC @ =gUnknown_030033FC
	movs r0, #4
	b _08082350
	.align 2, 0
_080822DC: .4byte gUnknown_030033FC
_080822E0:
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	movs r1, #2
	bl DivRem
	cmp r0, #1
	bne _08082352
	ldr r0, _08082304 @ =gUnknown_030033FC
	str r5, [r0]
	bl sub_0803BC94
_080822F8:
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08082352
	bl sub_08084974
	b _08082352
	.align 2, 0
_08082304: .4byte gUnknown_030033FC
_08082308:
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r0, [r0]
	movs r2, #0x66
	adds r2, r2, r7
	mov r8, r2
	cmp r0, #3
	bne _08082352
	movs r3, #0
	ldrsh r0, [r2, r3]
	movs r1, #2
	bl DivRem
	cmp r0, #0
	bne _0808233C
	ldr r1, _08082338 @ =gUnknown_030033FC
	movs r0, #8
	b _08082350
	.align 2, 0
_08082338: .4byte gUnknown_030033FC
_0808233C:
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #2
	bl DivRem
	cmp r0, #1
	bne _08082352
	ldr r1, _08082384 @ =gUnknown_030033FC
	movs r0, #7
_08082350:
	str r0, [r1]
_08082352:
	ldr r1, _08082388 @ =gUnknown_03005934
	mov r3, sb
	ldrh r0, [r3]
	str r0, [r1]
	ldr r1, _0808238C @ =gUnknown_03005924
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	str r0, [r1]
	movs r0, #0x71
	bl sub_0803B4DC
	ldr r0, _08082390 @ =gUnknown_08616A68
	adds r1, r7, #0
	bl Proc_Start
	bl sub_0803BD54
_08082376:
	movs r0, #0x4e
	adds r0, r0, r7
	mov sl, r0
_0808237C:
	adds r6, r7, #0
	adds r6, #0x4c
	b _080823D2
	.align 2, 0
_08082384: .4byte gUnknown_030033FC
_08082388: .4byte gUnknown_03005934
_0808238C: .4byte gUnknown_03005924
_08082390: .4byte gUnknown_08616A68
_08082394:
	movs r0, #0x22
	ands r0, r1
	cmp r0, #0
	beq _080823D2
	adds r1, r7, #0
	adds r1, #0x68
	ldr r0, _080823C0 @ =0x0000FFFF
	strh r0, [r1]
	strh r2, [r6]
	mov r1, sl
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldrh r1, [r3, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080823C4
	movs r0, #0x66
	bl sub_0803B4DC
	b _080823D2
	.align 2, 0
_080823C0: .4byte 0x0000FFFF
_080823C4:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080823D2
	movs r0, #0x67
	bl sub_0803B4DC
_080823D2:
	ldr r0, _0808245C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08082476
	movs r0, #0x20
	bl sub_0803CBD8
	cmp r0, #0
	beq _08082412
	ldr r4, _08082460 @ =gUnknown_0861696C
	adds r0, r7, #0
	adds r0, #0x52
	ldrh r0, [r0]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r3, [r0]
	cmp r3, #0
	bne _08082412
	ldr r0, _08082464 @ =gUnknown_03005968
	ldr r1, [r0]
	mvns r1, r1
	movs r2, #1
	ands r1, r2
	str r1, [r0]
	str r2, [r7, #0x60]
	strh r3, [r6]
_08082412:
	ldr r0, _0808245C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08082476
	movs r0, #0x28
	bl sub_0803CBD8
	cmp r0, #0
	beq _08082476
	ldr r4, _08082460 @ =gUnknown_0861696C
	adds r0, r7, #0
	adds r0, #0x52
	ldrh r0, [r0]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #2
	bne _08082476
	ldr r0, _08082468 @ =gUnknown_03005920
	ldr r1, [r0]
	mvns r1, r1
	movs r2, #1
	ands r1, r2
	str r1, [r0]
	cmp r1, #0
	beq _0808246C
	movs r0, #6
	bl sub_080845A8
	b _08082472
	.align 2, 0
_0808245C: .4byte gpKeySt
_08082460: .4byte gUnknown_0861696C
_08082464: .4byte gUnknown_03005968
_08082468: .4byte gUnknown_03005920
_0808246C:
	movs r0, #2
	bl sub_080845A8
_08082472:
	movs r0, #0
	strh r0, [r6]
_08082476:
	ldr r2, [sp, #4]
	cmp r2, #0
	beq _08082484
	movs r0, #0x22
	ldr r3, [sp]
	subs r0, r0, r3
	strh r0, [r6]
_08082484:
	adds r0, r7, #0
	bl sub_080824D4
	adds r0, r7, #0
	bl sub_08084700
	ldr r0, [r7, #0x60]
	cmp r0, #0
	beq _080824A2
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bne _080824A2
	movs r0, #0
	str r0, [r7, #0x60]
_080824A2:
	ldrh r0, [r6]
	adds r1, r0, #1
	strh r1, [r6]
	mov r2, sl
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _080824B8
	ldr r0, [r7, #0x58]
	adds r0, #1
	b _080824C2
_080824B8:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _080824C4
	movs r0, #0
_080824C2:
	str r0, [r7, #0x58]
_080824C4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

