	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804D5D8
sub_0804D5D8: @ 0x0804D5D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	mov r8, r1
	lsls r4, r4, #0x10
	lsrs r0, r4, #0x10
	str r0, [sp, #8]
	asrs r4, r4, #0x10
	mov r5, sp
	adds r0, r4, #0
	mov r1, sp
	bl sub_0801566C
	ldrh r0, [r5, #4]
	lsls r7, r0, #0x16
	lsrs r2, r7, #0x16
	mov r1, r8
	ldrh r6, [r1, #4]
	subs r2, r6, r2
	ldr r1, _0804D648 @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	lsls r2, r2, #0x10
	lsrs r0, r2, #0x10
	mov sl, r0
	ldr r5, _0804D64C @ =gUnknown_08136074
	ldr r3, [r5]
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #5
	adds r0, r3, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldrh r0, [r0]
	mov sb, r0
	adds r3, #0x34
	adds r1, r1, r3
	ldrh r1, [r1]
	mov ip, r1
	lsrs r3, r2, #0x15
	cmp r3, #0xa
	bls _0804D650
	movs r1, #0xfc
	lsls r1, r1, #8
	ands r1, r6
	lsrs r0, r7, #0x16
	adds r0, #0x20
	adds r1, r1, r0
	mov r2, r8
	strh r1, [r2, #4]
	b _0804D65E
	.align 2, 0
_0804D648: .4byte 0x000003FF
_0804D64C: .4byte gUnknown_08136074
_0804D650:
	movs r1, #0xfc
	lsls r1, r1, #8
	ands r1, r6
	lsrs r0, r7, #0x16
	adds r0, r0, r1
	mov r6, r8
	strh r0, [r6, #4]
_0804D65E:
	ldr r1, [r5]
	ldr r2, [sp, #8]
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #5
	adds r1, #0x28
	adds r5, r0, r1
	ldr r0, [r5]
	cmp sl, r0
	beq _0804D6B6
	ldr r2, _0804D6A8 @ =gUnknown_02029A10
	mov r6, ip
	lsls r0, r6, #3
	add r0, ip
	lsls r0, r0, #2
	movs r1, #0xb4
	mov r6, sb
	muls r6, r1, r6
	adds r1, r6, #0
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r4, r0
	bne _0804D6B6
	mov r2, sl
	str r2, [r5]
	cmp r3, #0xa
	bls _0804D6AC
	mov r0, sb
	mov r1, ip
	adds r2, r3, #0
	bl sub_0804D6FC
	b _0804D6B6
	.align 2, 0
_0804D6A8: .4byte gUnknown_02029A10
_0804D6AC:
	mov r0, sb
	mov r1, ip
	adds r2, r3, #0
	bl sub_0804D6C8
_0804D6B6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

