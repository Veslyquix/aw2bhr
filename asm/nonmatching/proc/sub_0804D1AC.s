	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804D1AC
sub_0804D1AC: @ 0x0804D1AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r1
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	mov r4, sp
	adds r0, r7, #0
	mov r1, sp
	bl sub_0801566C
	ldrh r3, [r4, #4]
	lsls r3, r3, #0x16
	lsrs r1, r3, #0x16
	mov r0, r8
	ldrh r4, [r0, #4]
	subs r1, r4, r1
	ldr r2, _0804D250 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	mov sb, r0
	ldr r2, _0804D254 @ =gUnknown_03001470
	mov ip, r2
	lsls r2, r7, #1
	adds r2, r2, r7
	lsls r2, r2, #5
	mov r0, ip
	adds r0, #0x30
	adds r0, r2, r0
	ldrh r5, [r0]
	mov r0, ip
	adds r0, #0x34
	adds r0, r2, r0
	ldrh r6, [r0]
	lsrs r1, r1, #0x14
	mov sl, r1
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r0, r4
	lsrs r3, r3, #0x16
	adds r3, r3, r0
	mov r0, r8
	strh r3, [r0, #4]
	mov r0, ip
	adds r0, #0x28
	adds r3, r2, r0
	ldr r0, [r3]
	cmp sb, r0
	beq _0804D23E
	ldr r2, _0804D258 @ =gUnknown_02029A10
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r5, r1
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r7, r0
	bne _0804D23E
	mov r2, sb
	str r2, [r3]
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, sl
	bl sub_0804D25C
_0804D23E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D250: .4byte 0x000003FF
_0804D254: .4byte gUnknown_03001470
_0804D258: .4byte gUnknown_02029A10

