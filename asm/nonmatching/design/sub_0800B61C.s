	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800B61C
sub_0800B61C: @ 0x0800B61C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r6, #0
	ldr r0, _0800B6F8 @ =gUnknown_0808D85C
	mov sb, r0
	cmp r5, #0
	ble _0800B668
	subs r7, r5, #1
	cmp r4, #0
	ble _0800B642
	subs r0, r4, #1
	adds r1, r7, #0
	bl IsTerrainLand
	lsls r6, r0, #8
_0800B642:
	adds r0, r4, #0
	adds r1, r7, #0
	bl IsTerrainLand
	lsls r0, r0, #7
	orrs r6, r0
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800B668
	adds r0, r4, #1
	adds r1, r7, #0
	bl IsTerrainLand
	lsls r0, r0, #6
	orrs r6, r0
_0800B668:
	cmp r4, #0
	ble _0800B678
	subs r0, r4, #1
	adds r1, r5, #0
	bl IsTerrainLand
	lsls r0, r0, #5
	orrs r6, r0
_0800B678:
	adds r0, r4, #0
	adds r1, r5, #0
	bl IsTerrainLand
	lsls r0, r0, #4
	orrs r6, r0
	mov r0, sb
	ldr r0, [r0]
	mov r8, r0
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800B6A0
	adds r0, r4, #1
	adds r1, r5, #0
	bl IsTerrainLand
	lsls r0, r0, #3
	orrs r6, r0
_0800B6A0:
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	bge _0800B6E0
	adds r7, r5, #1
	cmp r4, #0
	ble _0800B6BE
	subs r0, r4, #1
	adds r1, r7, #0
	bl IsTerrainLand
	lsls r0, r0, #2
	orrs r6, r0
_0800B6BE:
	adds r0, r4, #0
	adds r1, r7, #0
	bl IsTerrainLand
	lsls r0, r0, #1
	orrs r6, r0
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800B6E0
	adds r0, r4, #1
	adds r1, r7, #0
	bl IsTerrainLand
	orrs r6, r0
_0800B6E0:
	ldr r1, _0800B6FC @ =gUnknown_084861C4
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r6, r0
	lsls r0, r6, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r2, [r0, r1]
	cmp r2, #0
	bge _0800B700
	adds r0, r2, #0
	b _0800BA8C
	.align 2, 0
_0800B6F8: .4byte gUnknown_0808D85C
_0800B6FC: .4byte gUnknown_084861C4
_0800B700:
	movs r1, #0xfc
	lsls r1, r1, #7
	ands r1, r2
	movs r0, #0xa8
	lsls r0, r0, #6
	cmp r1, r0
	bne _0800B710
	b _0800B8F4
_0800B710:
	cmp r1, r0
	bgt _0800B77C
	movs r0, #0xc0
	lsls r0, r0, #4
	cmp r1, r0
	bne _0800B71E
	b _0800B9CE
_0800B71E:
	cmp r1, r0
	bgt _0800B74C
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _0800B7E2
	cmp r1, r0
	bgt _0800B738
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	beq _0800B7FA
	b _0800BA80
_0800B738:
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	beq _0800B81E
	movs r0, #0xa0
	lsls r0, r0, #4
	cmp r1, r0
	bne _0800B74A
	b _0800B9EE
_0800B74A:
	b _0800BA80
_0800B74C:
	movs r0, #0xa0
	lsls r0, r0, #5
	cmp r1, r0
	bne _0800B756
	b _0800BA3C
_0800B756:
	cmp r1, r0
	bgt _0800B766
	movs r0, #0x90
	lsls r0, r0, #5
	cmp r1, r0
	bne _0800B764
	b _0800BA60
_0800B764:
	b _0800BA80
_0800B766:
	movs r0, #0x88
	lsls r0, r0, #6
	cmp r1, r0
	bne _0800B770
	b _0800B9AA
_0800B770:
	movs r0, #0x90
	lsls r0, r0, #6
	cmp r1, r0
	bne _0800B77A
	b _0800B986
_0800B77A:
	b _0800BA80
_0800B77C:
	movs r0, #0x94
	lsls r0, r0, #7
	cmp r1, r0
	beq _0800B83A
	cmp r1, r0
	bgt _0800B7B8
	movs r0, #0xc8
	lsls r0, r0, #6
	cmp r1, r0
	bne _0800B792
	b _0800B90C
_0800B792:
	cmp r1, r0
	bgt _0800B7A2
	movs r0, #0xb0
	lsls r0, r0, #6
	cmp r1, r0
	bne _0800B7A0
	b _0800B8B6
_0800B7A0:
	b _0800BA80
_0800B7A2:
	movs r0, #0xd0
	lsls r0, r0, #6
	cmp r1, r0
	bne _0800B7AC
	b _0800B8CE
_0800B7AC:
	movs r0, #0x90
	lsls r0, r0, #7
	cmp r1, r0
	bne _0800B7B6
	b _0800B932
_0800B7B6:
	b _0800BA80
_0800B7B8:
	movs r0, #0xa0
	lsls r0, r0, #7
	cmp r1, r0
	bne _0800B7C2
	b _0800B95C
_0800B7C2:
	cmp r1, r0
	bgt _0800B7D0
	movs r0, #0x98
	lsls r0, r0, #7
	cmp r1, r0
	beq _0800B85C
	b _0800BA80
_0800B7D0:
	movs r0, #0xa4
	lsls r0, r0, #7
	cmp r1, r0
	beq _0800B878
	movs r0, #0xa8
	lsls r0, r0, #7
	cmp r1, r0
	beq _0800B89A
	b _0800BA80
_0800B7E2:
	cmp r4, #0
	ble _0800B836
	subs r0, r4, #1
	adds r1, r5, #0
	bl sub_0800B4F0
	movs r2, #0xb6
	cmp r0, #0
	bne _0800B7F6
	b _0800BA80
_0800B7F6:
	movs r2, #0xf3
	b _0800BA84
_0800B7FA:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	blt _0800B80A
	b _0800BA38
_0800B80A:
	adds r0, r4, #1
	adds r1, r5, #0
	bl sub_0800B4F0
	movs r2, #0xb7
	cmp r0, #0
	bne _0800B81A
	b _0800BA80
_0800B81A:
	movs r2, #0xf2
	b _0800BA84
_0800B81E:
	cmp r4, #0
	ble _0800B836
	subs r1, r5, #1
	adds r0, r4, #0
	bl sub_0800B4F0
	movs r2, #0xb6
	cmp r0, #0
	bne _0800B832
	b _0800BA80
_0800B832:
	movs r2, #0xd2
	b _0800BA84
_0800B836:
	movs r2, #0xb6
	b _0800BA84
_0800B83A:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800B874
	adds r0, r4, #1
	adds r1, r5, #0
	bl sub_0800B4F0
	movs r2, #0x8f
	cmp r0, #0
	bne _0800B858
	b _0800BA80
_0800B858:
	movs r2, #0x6d
	b _0800BA84
_0800B85C:
	cmp r4, #0
	ble _0800B874
	subs r0, r4, #1
	adds r1, r5, #0
	bl sub_0800B4F0
	movs r2, #0x8f
	cmp r0, #0
	bne _0800B870
	b _0800BA80
_0800B870:
	movs r2, #0x6e
	b _0800BA84
_0800B874:
	movs r2, #0x8f
	b _0800BA84
_0800B878:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800B8B2
	adds r0, r4, #1
	adds r1, r5, #0
	bl sub_0800B4F0
	movs r2, #0xef
	cmp r0, #0
	bne _0800B896
	b _0800BA80
_0800B896:
	movs r2, #0xcd
	b _0800BA84
_0800B89A:
	cmp r4, #0
	ble _0800B8B2
	subs r0, r4, #1
	adds r1, r5, #0
	bl sub_0800B4F0
	movs r2, #0xef
	cmp r0, #0
	bne _0800B8AE
	b _0800BA80
_0800B8AE:
	movs r2, #0xce
	b _0800BA84
_0800B8B2:
	movs r2, #0xef
	b _0800BA84
_0800B8B6:
	cmp r5, #0
	ble _0800B8F0
	subs r1, r5, #1
	adds r0, r4, #0
	bl sub_0800B4F0
	movs r2, #0x92
	cmp r0, #0
	bne _0800B8CA
	b _0800BA80
_0800B8CA:
	movs r2, #0xcf
	b _0800BA84
_0800B8CE:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	bge _0800B8F0
	adds r1, r5, #1
	adds r0, r4, #0
	bl sub_0800B4F0
	movs r2, #0x92
	cmp r0, #0
	bne _0800B8EC
	b _0800BA80
_0800B8EC:
	movs r2, #0xaf
	b _0800BA84
_0800B8F0:
	movs r2, #0x92
	b _0800BA84
_0800B8F4:
	cmp r5, #0
	ble _0800B92E
	subs r1, r5, #1
	adds r0, r4, #0
	bl sub_0800B4F0
	movs r2, #0x93
	cmp r0, #0
	bne _0800B908
	b _0800BA80
_0800B908:
	movs r2, #0xd0
	b _0800BA84
_0800B90C:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	bge _0800B92E
	adds r1, r5, #1
	adds r0, r4, #0
	bl sub_0800B4F0
	movs r2, #0x93
	cmp r0, #0
	bne _0800B92A
	b _0800BA80
_0800B92A:
	movs r2, #0xb0
	b _0800BA84
_0800B92E:
	movs r2, #0x93
	b _0800BA84
_0800B932:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800B5C0
	adds r1, r0, #0
	movs r0, #7
	ands r1, r0
	movs r2, #0x10
	cmp r1, #6
	bne _0800B948
	b _0800BA84
_0800B948:
	movs r2, #0x6e
	cmp r1, #4
	bne _0800B950
	b _0800BA84
_0800B950:
	movs r2, #0x8f
	cmp r1, #2
	beq _0800B958
	b _0800BA80
_0800B958:
	movs r2, #0x6d
	b _0800BA84
_0800B95C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800B5C0
	adds r1, r0, #0
	movs r0, #0xe
	ands r1, r0
	movs r2, #0x50
	cmp r1, #6
	bne _0800B972
	b _0800BA84
_0800B972:
	movs r2, #0xcd
	cmp r1, #2
	bne _0800B97A
	b _0800BA84
_0800B97A:
	movs r2, #0xef
	cmp r1, #4
	beq _0800B982
	b _0800BA80
_0800B982:
	movs r2, #0xce
	b _0800BA84
_0800B986:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800B5C0
	adds r1, r0, #0
	movs r0, #9
	ands r1, r0
	movs r2, #0x2e
	cmp r1, #9
	beq _0800BA84
	movs r2, #0xcf
	cmp r1, #8
	beq _0800BA84
	movs r2, #0x92
	cmp r1, #1
	bne _0800BA80
	movs r2, #0xaf
	b _0800BA84
_0800B9AA:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800B5C0
	adds r1, r0, #0
	movs r0, #9
	ands r1, r0
	movs r2, #0x32
	cmp r1, #9
	beq _0800BA84
	movs r2, #0xd0
	cmp r1, #8
	beq _0800BA84
	movs r2, #0x93
	cmp r1, #1
	bne _0800BA80
	movs r2, #0xb0
	b _0800BA84
_0800B9CE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800B5C0
	adds r1, r0, #0
	movs r2, #0xf3
	cmp r1, #4
	beq _0800BA84
	movs r2, #0xd2
	cmp r1, #8
	beq _0800BA84
	movs r2, #0xb6
	cmp r1, #0xc
	bne _0800BA80
	movs r2, #0x2f
	b _0800BA84
_0800B9EE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800B5C0
	adds r1, r0, #0
	cmp r1, #2
	bne _0800B9FE
	b _0800B81A
_0800B9FE:
	cmp r1, #8
	beq _0800BA22
	cmp r1, #0xa
	bne _0800BA38
	cmp r4, #0
	bgt _0800BA0C
	b _0800B81A
_0800BA0C:
	cmp r5, #0
	bgt _0800BA12
	b _0800B81A
_0800BA12:
	subs r0, r4, #1
	subs r1, r5, #1
	bl IsTerrainLand
	movs r2, #0x31
	cmp r0, #0
	bne _0800BA80
	b _0800B81A
_0800BA22:
	cmp r4, #0
	ble _0800BA38
	cmp r5, #0
	ble _0800BA38
	subs r0, r4, #1
	subs r1, r5, #1
	bl IsTerrainLand
	movs r2, #0xd3
	cmp r0, #0
	bne _0800BA80
_0800BA38:
	movs r2, #0xb7
	b _0800BA84
_0800BA3C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800B5C0
	adds r1, r0, #0
	ldr r2, _0800BA5C @ =0x00000113
	cmp r1, #4
	beq _0800BA84
	movs r2, #0xb2
	cmp r1, #1
	beq _0800BA84
	movs r2, #0xd6
	cmp r1, #5
	bne _0800BA80
	movs r2, #0x4f
	b _0800BA84
	.align 2, 0
_0800BA5C: .4byte 0x00000113
_0800BA60:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800B5C0
	adds r1, r0, #0
	movs r2, #0x89
	lsls r2, r2, #1
	cmp r1, #2
	beq _0800BA84
	movs r2, #0xb3
	cmp r1, #1
	beq _0800BA84
	movs r2, #0xd7
	cmp r1, #3
	bne _0800BA80
	movs r2, #0x51
_0800BA80:
	cmp r2, #0
	ble _0800BA88
_0800BA84:
	ldr r0, _0800BA98 @ =0x000001FF
	ands r2, r0
_0800BA88:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
_0800BA8C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800BA98: .4byte 0x000001FF

