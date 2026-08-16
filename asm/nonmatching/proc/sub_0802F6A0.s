	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802F6A0
sub_0802F6A0: @ 0x0802F6A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp, #4]
	lsls r0, r0, #0x18
	movs r1, #0
	mov r8, r1
	movs r2, #0
	str r2, [sp, #8]
	ldr r3, _0802F734 @ =gUnknown_08090C8C
	ldr r1, [r3]
	lsrs r2, r0, #0x18
	str r2, [sp]
	asrs r4, r0, #0x17
	adds r5, r4, r1
	ldr r1, _0802F738 @ =gUnknown_08090C90
	ldr r0, [r1]
	adds r6, r4, r0
	ldrh r2, [r5]
	ldrh r0, [r6]
	mov sl, r3
	cmp r2, r0
	bne _0802F6D6
	b _0802F7F4
_0802F6D6:
	ldr r0, _0802F73C @ =gUnknown_08090C94
	ldr r3, [r0]
	mov ip, r3
	ldrh r1, [r5]
	lsls r1, r1, #3
	adds r1, r4, r1
	add r1, ip
	ldrh r1, [r1]
	ldr r7, _0802F740 @ =0x00004FFF
	cmp r1, r7
	beq _0802F748
	ldrh r1, [r5]
	ldrh r0, [r6]
	cmp r1, r0
	beq _0802F788
	adds r3, r4, #0
	adds r2, r5, #0
	mov sb, ip
	ldr r0, _0802F744 @ =0x000003FF
	mov ip, r0
	adds r5, r7, #0
	adds r4, r6, #0
_0802F702:
	ldrh r0, [r2]
	adds r0, #1
	ldrh r1, [r2]
	strh r0, [r2]
	ldrh r1, [r2]
	mov r0, ip
	ands r0, r1
	ldrh r1, [r2]
	strh r0, [r2]
	ldrh r0, [r2]
	lsls r0, r0, #3
	adds r0, r3, r0
	add r0, sb
	ldrh r0, [r0]
	cmp r0, r5
	bne _0802F72A
	ldrh r1, [r2]
	ldrh r0, [r4]
	cmp r1, r0
	bne _0802F748
_0802F72A:
	ldrh r1, [r2]
	ldrh r0, [r4]
	cmp r1, r0
	bne _0802F702
	b _0802F788
	.align 2, 0
_0802F734: .4byte gUnknown_08090C8C
_0802F738: .4byte gUnknown_08090C90
_0802F73C: .4byte gUnknown_08090C94
_0802F740: .4byte 0x00004FFF
_0802F744: .4byte 0x000003FF
_0802F748:
	ldr r0, _0802F76C @ =gUnknown_03003F48
	ldr r1, [sp]
	lsls r2, r1, #0x18
	asrs r1, r2, #0x17
	adds r4, r1, r0
	mov r3, sl
	ldr r0, [r3]
	adds r3, r1, r0
	ldrh r1, [r4]
	ldrh r0, [r3]
	cmp r1, r0
	bhs _0802F774
	ldrh r1, [r3]
	ldr r0, _0802F770 @ =0xFFFFFC00
	adds r1, r1, r0
	ldrh r0, [r4]
	b _0802F778
	.align 2, 0
_0802F76C: .4byte gUnknown_03003F48
_0802F770: .4byte 0xFFFFFC00
_0802F774:
	ldrh r0, [r4]
	ldrh r1, [r3]
_0802F778:
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	adds r7, r0, #0
	cmp r1, #1
	bgt _0802F78E
_0802F788:
	movs r0, #4
	rsbs r0, r0, #0
	b _0802F8EA
_0802F78E:
	mov r3, sl
	ldr r1, [r3]
	asrs r0, r2, #0x17
	adds r4, r0, r1
	ldrh r0, [r4]
	adds r0, #1
	ldr r1, _0802F7AC @ =0x000003FF
	cmp r0, r1
	bgt _0802F7B0
	ldrh r0, [r4]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0802F7B2
	.align 2, 0
_0802F7AC: .4byte 0x000003FF
_0802F7B0:
	movs r0, #0
_0802F7B2:
	ldr r6, _0802F7E4 @ =gUnknown_02025C18
	asrs r4, r2, #0x17
	lsls r0, r0, #3
	adds r0, r4, r0
	adds r0, r0, r6
	ldrh r0, [r0]
	mov ip, r0
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0x80
	ble _0802F7EC
	mov r1, sl
	ldr r0, [r1]
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r1, #1
	ldrh r2, [r0]
	strh r1, [r0]
	ldrh r2, [r0]
	ldr r1, _0802F7E8 @ =0x000003FF
	ands r1, r2
	ldrh r2, [r0]
	strh r1, [r0]
	b _0802F788
	.align 2, 0
_0802F7E4: .4byte gUnknown_02025C18
_0802F7E8: .4byte 0x000003FF
_0802F7EC:
	adds r1, r5, #6
	asrs r0, r7, #0x10
	cmp r1, r0
	ble _0802F7FA
_0802F7F4:
	movs r0, #2
	rsbs r0, r0, #0
	b _0802F8EA
_0802F7FA:
	mov r2, sl
	ldr r0, [r2]
	adds r3, r4, r0
	ldrh r0, [r3]
	adds r0, #2
	ldrh r1, [r3]
	strh r0, [r3]
	ldrh r1, [r3]
	ldr r7, _0802F8DC @ =0x000003FF
	adds r0, r7, #0
	ands r0, r1
	ldrh r1, [r3]
	strh r0, [r3]
	ldrh r0, [r3]
	lsls r0, r0, #3
	adds r0, r4, r0
	adds r0, r0, r6
	ldrh r0, [r0]
	mov sl, r0
	ldrh r0, [r3]
	adds r0, #1
	ldrh r1, [r3]
	strh r0, [r3]
	ldrh r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ldrh r1, [r3]
	strh r0, [r3]
	ldrh r0, [r3]
	lsls r0, r0, #3
	adds r0, r4, r0
	adds r0, r0, r6
	ldrh r0, [r0]
	mov sb, r0
	ldrh r0, [r3]
	adds r0, #1
	ldrh r1, [r3]
	strh r0, [r3]
	ldrh r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ldrh r1, [r3]
	strh r0, [r3]
	ldr r0, _0802F8E0 @ =0x00004FFF
	adds r1, r5, r0
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r2, #0
	cmp r2, r5
	bge _0802F8CA
	ldr r5, [sp, #4]
_0802F86A:
	ldrh r0, [r3]
	lsls r0, r0, #3
	adds r0, r4, r0
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r2, #1
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldrh r0, [r3]
	lsls r0, r0, #3
	adds r0, r4, r0
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	mvns r0, r0
	ldr r1, [sp, #8]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldrh r0, [r3]
	lsls r0, r0, #3
	adds r0, r4, r0
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r5]
	ldrh r0, [r3]
	adds r0, #1
	ldrh r1, [r3]
	strh r0, [r3]
	ldrh r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ldrh r1, [r3]
	strh r0, [r3]
	adds r5, #2
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	blt _0802F86A
_0802F8CA:
	cmp r8, sl
	bne _0802F8D4
	ldr r2, [sp, #8]
	cmp r2, sb
	beq _0802F8E4
_0802F8D4:
	movs r0, #3
	rsbs r0, r0, #0
	b _0802F8EA
	.align 2, 0
_0802F8DC: .4byte 0x000003FF
_0802F8E0: .4byte 0x00004FFF
_0802F8E4:
	mov r3, ip
	lsls r0, r3, #0x11
	asrs r0, r0, #0x10
_0802F8EA:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

