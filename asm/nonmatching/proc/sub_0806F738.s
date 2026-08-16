	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F738
sub_0806F738: @ 0x0806F738
	movs r1, #0x90
	b _0806F844

	thumb_func_start sub_0806F73C
sub_0806F73C: @ 0x0806F73C
	movs r0, r0
	b _0806FC48

	thumb_func_start sub_0806F740
sub_0806F740: @ 0x0806F740
	.hword 0xFF1E
	b sub_0806F9A4

	thumb_func_start sub_0806F744
sub_0806F744: @ 0x0806F744
	ldr r0, _0806F7B0 @ =gUnknown_03007FF0
	ldr r0, [r0]
	ldr r2, _0806F7B4 @ =0x68736D53
	ldr r3, [r0]
	cmp r2, r3
	beq _0806F752
	bx lr
_0806F752:
	adds r3, #1
	str r3, [r0]
	push {r4, r5, r6, r7, lr}
	mov r1, r8
	mov r2, sb
	mov r3, sl
	mov r4, fp
	push {r0, r1, r2, r3, r4}
	sub sp, #0x18
	ldrb r1, [r0, #0xc]
	cmp r1, #0
	beq _0806F776
	ldr r2, _0806F7BC @ =0x04000006
	ldrb r2, [r2]
	cmp r2, #0xa0
	bhs _0806F774
	adds r2, #0xe4
_0806F774:
	adds r1, r1, r2
_0806F776:
	str r1, [sp, #0x14]
	ldr r3, [r0, #0x20]
	cmp r3, #0
	beq _0806F786
	ldr r0, [r0, #0x24]
	bl sub_0806FB66
	ldr r0, [sp, #0x18]
_0806F786:
	ldr r3, [r0, #0x28]
	bl sub_0806FB66
	ldr r0, [sp, #0x18]
	ldr r3, [r0, #0x10]
	mov r8, r3
	ldr r5, _0806F7C0 @ =0x00000350
	adds r5, r5, r0
	ldrb r4, [r0, #4]
	subs r7, r4, #1
	bls _0806F7A6
	ldrb r1, [r0, #0xb]
	subs r1, r1, r7
	mov r2, r8
	muls r2, r1, r2
	adds r5, r5, r2
_0806F7A6:
	str r5, [sp, #8]
	ldr r6, _0806F7C4 @ =0x00000630
	ldr r3, _0806F7B8 @ =gUnknown_03000FB1
	bx r3
	.align 2, 0
_0806F7B0: .4byte gUnknown_03007FF0
_0806F7B4: .4byte 0x68736D53
_0806F7B8: .4byte gUnknown_03000FB1
_0806F7BC: .4byte 0x04000006
_0806F7C0: .4byte 0x00000350
_0806F7C4: .4byte 0x00000630

	thumb_func_start sub_0806F7C8
sub_0806F7C8: @ 0x0806F7C8
	ldrb r3, [r0, #5]
	cmp r3, #0
	beq sub_0806F828
	add r1, pc, #0x4 @ =sub_0806F7D4
	bx r1
	.align 2, 0

	arm_func_start sub_0806F7D4
sub_0806F7D4: @ 0x0806F7D4
	cmp r4, #2
	addeq r7, r0, #0x350
	addne r7, r5, r8
	mov r4, r8
_0806F7E4:
	ldrsb r0, [r5, r6]
	ldrsb r1, [r5]
	add r0, r0, r1
	ldrsb r1, [r7, r6]
	add r0, r0, r1
	ldrsb r1, [r7], #1
	add r0, r0, r1
	mul r1, r0, r3
	asr r0, r1, #9
	tst r0, #0x80
	addne r0, r0, #1
	strb r0, [r5, r6]
	strb r0, [r5], #1
	subs r4, r4, #1
	bgt _0806F7E4
	add r0, pc, #0x2F @ =sub_0806F856
	bx r0

	thumb_func_start sub_0806F828
sub_0806F828: @ 0x0806F828
	movs r0, #0
	mov r1, r8
	adds r6, r6, r5
	lsrs r1, r1, #3
	blo _0806F836
	stm r5!, {r0}
	stm r6!, {r0}
_0806F836:
	lsrs r1, r1, #1
	blo _0806F842
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
_0806F842:
	stm r5!, {r0}
_0806F844:
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	subs r1, #1
	bgt _0806F842

	non_word_aligned_thumb_func_start sub_0806F856
sub_0806F856: @ 0x0806F856
	ldr r4, [sp, #0x18]
	ldr r0, [r4, #0x18]
	mov ip, r0
	ldrb r0, [r4, #6]
	adds r4, #0x50
_0806F860:
	str r0, [sp, #4]
	ldr r3, [r4, #0x24]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0806F880
	ldr r1, _0806F87C @ =0x04000006
	ldrb r1, [r1]
	cmp r1, #0xa0
	bhs _0806F874
	adds r1, #0xe4
_0806F874:
	cmp r1, r0
	blo _0806F880
	b _0806FB52
	.align 2, 0
_0806F87C: .4byte 0x04000006
_0806F880:
	ldrb r6, [r4]
	movs r0, #0xc7
	tst r0, r6
	bne _0806F88A
	b sub_0806FB48
_0806F88A:
	movs r0, #0x80
	tst r0, r6
	beq _0806F8BA
	movs r0, #0x40
	tst r0, r6
	bne _0806F8CA
	movs r6, #3
	strb r6, [r4]
	adds r0, r3, #0
	adds r0, #0x10
	str r0, [r4, #0x28]
	ldr r0, [r3, #0xc]
	str r0, [r4, #0x18]
	movs r5, #0
	strb r5, [r4, #9]
	str r5, [r4, #0x1c]
	ldrb r2, [r3, #3]
	movs r0, #0xc0
	tst r0, r2
	beq _0806F912
	movs r0, #0x10
	orrs r6, r0
	strb r6, [r4]
	b _0806F912
_0806F8BA:
	ldrb r5, [r4, #9]
	movs r0, #4
	tst r0, r6
	beq _0806F8D0
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	bhi _0806F920
_0806F8CA:
	movs r0, #0
	strb r0, [r4]
	b sub_0806FB48
_0806F8D0:
	movs r0, #0x40
	tst r0, r6
	beq _0806F8F0
	ldrb r0, [r4, #7]
	muls r5, r0, r5
	lsrs r5, r5, #8
	ldrb r0, [r4, #0xc]
	cmp r5, r0
	bhi _0806F920
_0806F8E2:
	ldrb r5, [r4, #0xc]
	cmp r5, #0
	beq _0806F8CA
	movs r0, #4
	orrs r6, r0
	strb r6, [r4]
	b _0806F920
_0806F8F0:
	movs r2, #3
	ands r2, r6
	cmp r2, #2
	bne _0806F90E
	ldrb r0, [r4, #5]
	muls r5, r0, r5
	lsrs r5, r5, #8
	ldrb r0, [r4, #6]
	cmp r5, r0
	bhi _0806F920
	adds r5, r0, #0
	beq _0806F8E2
	subs r6, #1
	strb r6, [r4]
	b _0806F920
_0806F90E:
	cmp r2, #3
	bne _0806F920
_0806F912:
	ldrb r0, [r4, #4]
	adds r5, r5, r0
	cmp r5, #0xff
	blo _0806F920
	movs r5, #0xff
	subs r6, #1
	strb r6, [r4]
_0806F920:
	strb r5, [r4, #9]
	ldr r0, [sp, #0x18]
	ldrb r0, [r0, #7]
	adds r0, #1
	muls r0, r5, r0
	lsrs r5, r0, #4
	ldrb r0, [r4, #2]
	muls r0, r5, r0
	lsrs r0, r0, #8
	strb r0, [r4, #0xa]
	ldrb r0, [r4, #3]
	muls r0, r5, r0
	lsrs r0, r0, #8
	strb r0, [r4, #0xb]
	movs r0, #0x10
	ands r0, r6
	str r0, [sp, #0x10]
	beq _0806F954
	adds r0, r3, #0
	adds r0, #0x10
	ldr r1, [r3, #8]
	adds r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, [r3, #0xc]
	subs r0, r0, r1
	str r0, [sp, #0x10]
_0806F954:
	ldr r5, [sp, #8]
	ldr r2, [r4, #0x18]
	ldr r3, [r4, #0x28]
	add r0, pc, #0x4 @ =sub_0806F960
	bx r0
	.align 2, 0

	arm_func_start sub_0806F960
sub_0806F960: @ 0x0806F960
	str r8, [sp]
	ldrb sl, [r4, #0xa]
	ldrb fp, [r4, #0xb]
	lsl sl, sl, #0x10
	lsl fp, fp, #0x10
	ldrb r0, [r4, #1]
	tst r0, #8
	beq _0806FAA0
_0806F980:
	cmp r2, #4
	ble _0806F9F0
	subs r2, r2, r8
	movgt lr, #0
	bgt sub_0806F9AC
	mov lr, r8
	add r2, r2, r8
	sub r8, r2, #4
	sub lr, lr, r8

	thumb_func_start sub_0806F9A4
sub_0806F9A4: @ 0x0806F9A4
	movs r0, #3
	b _0806FDCE

	thumb_func_start sub_0806F9A8
sub_0806F9A8: @ 0x0806F9A8
	movs r0, #4
	lsls r0, r4, #0xe

	arm_func_start sub_0806F9AC
sub_0806F9AC: @ 0x0806F9AC
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_0806F9B4:
	ldrsb r0, [r3], #1
	mul r1, sl, r0
	bic r1, r1, #0xff0000
	add r6, r1, r6, ror #8
	mul r1, fp, r0
	bic r1, r1, #0xff0000
	add r7, r1, r7, ror #8
	adds r5, r5, #0x40000000
	blo _0806F9B4
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt sub_0806F9AC
	adds r8, r8, lr
	beq _0806FB34
_0806F9F0:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_0806F9F8:
	ldrsb r0, [r3], #1
	mul r1, sl, r0
	bic r1, r1, #0xff0000
	add r6, r1, r6, ror #8
	mul r1, fp, r0
	bic r1, r1, #0xff0000
	add r7, r1, r7, ror #8
	subs r2, r2, #1
	beq _0806FA68
_0806FA1C:
	adds r5, r5, #0x40000000
	blo _0806F9F8
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _0806F980
	b _0806FB34
_0806FA38:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _0806FA5C
	ldr r3, [sp, #0x14]
	rsb sb, r2, #0
_0806FA4C:
	adds r2, r0, r2
	bgt _0806FB04
	sub sb, sb, r0
	b _0806FA4C
_0806FA5C:
	pop {r4, ip}
	mov r2, #0
	b _0806FA78
_0806FA68:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	ldrne r3, [sp, #0xc]
	bne _0806FA1C
_0806FA78:
	strb r2, [r4]
	lsr r0, r5, #0x1e
	bic r5, r5, #0xc0000000
	rsb r0, r0, #3
	lsl r0, r0, #3
	ror r6, r6, r0
	ror r7, r7, r0
	str r7, [r5, #0x630]
	str r6, [r5], #4
	b _0806FB3C
_0806FAA0:
	push {r4, ip}
	ldr lr, [r4, #0x1c]
	ldr r1, [r4, #0x20]
	mul r4, ip, r1
	ldrsb r0, [r3]
	ldrsb r1, [r3, #1]!
	sub r1, r1, r0
_0806FABC:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_0806FAC4:
	mul sb, lr, r1
	add sb, r0, sb, asr #23
	mul ip, sl, sb
	bic ip, ip, #0xff0000
	add r6, ip, r6, ror #8
	mul ip, fp, sb
	bic ip, ip, #0xff0000
	add r7, ip, r7, ror #8
	add lr, lr, r4
	lsrs sb, lr, #0x17
	beq _0806FB10
	bic lr, lr, #0x3f800000
	subs r2, r2, sb
	ble _0806FA38
	subs sb, sb, #1
	addeq r0, r0, r1
_0806FB04:
	ldrsbne r0, [r3, sb]!
	ldrsb r1, [r3, #1]!
	sub r1, r1, r0
_0806FB10:
	adds r5, r5, #0x40000000
	blo _0806FAC4
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _0806FABC
	sub r3, r3, #1
	pop {r4, ip}
	str lr, [r4, #0x1c]
_0806FB34:
	str r2, [r4, #0x18]
	str r3, [r4, #0x28]
_0806FB3C:
	ldr r8, [sp]
	add r0, pc, #0x1 @ =sub_0806FB48
	bx r0

	thumb_func_start sub_0806FB48
sub_0806FB48: @ 0x0806FB48
	ldr r0, [sp, #4]
	subs r0, #1
	ble _0806FB52
	adds r4, #0x40
	b _0806F860
_0806FB52:
	ldr r0, [sp, #0x18]
	ldr r3, _0806FB68 @ =0x68736D53
	str r3, [r0]
	add sp, #0x1c
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r3}

	non_word_aligned_thumb_func_start sub_0806FB66
sub_0806FB66: @ 0x0806FB66
	bx r3
	.align 2, 0
_0806FB68: .4byte 0x68736D53

	thumb_func_start sub_0806FB6C
sub_0806FB6C: @ 0x0806FB6C
	mov ip, r4
	movs r1, #0
	movs r2, #0
	movs r3, #0
	movs r4, #0
	stm r0!, {r1, r2, r3, r4}
	stm r0!, {r1, r2, r3, r4}
	stm r0!, {r1, r2, r3, r4}
	stm r0!, {r1, r2, r3, r4}
	mov r4, ip
	bx lr
	.align 2, 0

	thumb_func_start sub_0806FB84
sub_0806FB84: @ 0x0806FB84
	ldr r3, [r0, #0x2c]
	cmp r3, #0
	beq _0806FBA2
	ldr r1, [r0, #0x34]
	ldr r2, [r0, #0x30]
	cmp r2, #0
	beq _0806FB96
	str r1, [r2, #0x34]
	b _0806FB98
_0806FB96:
	str r1, [r3, #0x20]
_0806FB98:
	cmp r1, #0
	beq _0806FB9E
	str r2, [r1, #0x30]
_0806FB9E:
	movs r1, #0
	str r1, [r0, #0x2c]
_0806FBA2:
	bx lr
_0806FBA4:
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _0806FBC8
_0806FBAE:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _0806FBBC
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r4]
_0806FBBC:
	adds r0, r4, #0
	bl sub_0806FB84
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _0806FBAE
_0806FBC8:
	movs r0, #0
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806FBD4
sub_0806FBD4: @ 0x0806FBD4
	mov ip, lr
	movs r1, #0x24
	ldr r2, _0806FC04 @ =gUnknown_081B9D64
_0806FBDA:
	ldr r3, [r2]
	bl _0806FBEE
	stm r0!, {r3}
	adds r2, #4
	subs r1, #1
	bgt _0806FBDA
	bx ip
	.align 2, 0

	thumb_func_start sub_0806FBEC
sub_0806FBEC: @ 0x0806FBEC
	ldrb r3, [r2]
_0806FBEE:
	push {r0}
	lsrs r0, r2, #0x19
	bne _0806FC00
	ldr r0, _0806FC04 @ =gUnknown_081B9D64
	cmp r2, r0
	blo _0806FBFE
	lsrs r0, r2, #0xe
	beq _0806FC00
_0806FBFE:
	movs r3, #0
_0806FC00:
	pop {r0}
	bx lr
	.align 2, 0
_0806FC04: .4byte gUnknown_081B9D64

	thumb_func_start sub_0806FC08
sub_0806FC08: @ 0x0806FC08
	ldr r2, [r1, #0x40]

	non_word_aligned_thumb_func_start sub_0806FC0A
sub_0806FC0A: @ 0x0806FC0A
	adds r3, r2, #1
	str r3, [r1, #0x40]
	ldrb r3, [r2]
	b _0806FBEE
	.align 2, 0
_0806FC14:
	push {lr}
_0806FC16:
	ldr r2, [r1, #0x40]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	ldrb r3, [r2, #2]
	orrs r0, r3
	lsls r0, r0, #8
	ldrb r3, [r2, #1]
	orrs r0, r3
	lsls r0, r0, #8
	bl sub_0806FBEC
	orrs r0, r3
	str r0, [r1, #0x40]
	pop {r0}
	bx r0

	thumb_func_start sub_0806FC34
sub_0806FC34: @ 0x0806FC34
	ldrb r2, [r1, #2]
	cmp r2, #3
	bhs _0806FC4C
	lsls r2, r2, #2
	adds r3, r1, r2
	ldr r2, [r1, #0x40]
	adds r2, #4
	str r2, [r3, #0x44]
	ldrb r2, [r1, #2]
	adds r2, #1
_0806FC48:
	strb r2, [r1, #2]
	b _0806FC14
_0806FC4C:
	b _0806FBA4
	.align 2, 0

	thumb_func_start sub_0806FC50
sub_0806FC50: @ 0x0806FC50
	ldrb r2, [r1, #2]
	cmp r2, #0
	beq _0806FC62
	subs r2, #1
	strb r2, [r1, #2]
	lsls r2, r2, #2
	adds r3, r1, r2
	ldr r2, [r3, #0x44]
	str r2, [r1, #0x40]
_0806FC62:
	bx lr

	thumb_func_start sub_0806FC64
sub_0806FC64: @ 0x0806FC64
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	cmp r3, #0
	bne _0806FC74
	adds r2, #1
	str r2, [r1, #0x40]
	b _0806FC16
_0806FC74:
	ldrb r3, [r1, #3]
	adds r3, #1
	strb r3, [r1, #3]
	mov ip, r3
	bl sub_0806FC08
	cmp ip, r3
	bhs _0806FC86
	b _0806FC16
_0806FC86:
	movs r3, #0
	strb r3, [r1, #3]
	adds r2, #5
	str r2, [r1, #0x40]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0806FC94
sub_0806FC94: @ 0x0806FC94
	mov ip, lr
	bl sub_0806FC08
	strb r3, [r1, #0x1d]
	bx ip
	.align 2, 0

	thumb_func_start sub_0806FCA0
sub_0806FCA0: @ 0x0806FCA0
	mov ip, lr
	bl sub_0806FC08
	lsls r3, r3, #1
	strh r3, [r0, #0x1c]
	ldrh r2, [r0, #0x1e]
	muls r3, r2, r3
	lsrs r3, r3, #8
	strh r3, [r0, #0x20]
	bx ip

	thumb_func_start sub_0806FCB4
sub_0806FCB4: @ 0x0806FCB4
	mov ip, lr
	bl sub_0806FC08
	strb r3, [r1, #0xa]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0

	thumb_func_start sub_0806FCC8
sub_0806FCC8: @ 0x0806FCC8
	mov ip, lr
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r1, #0x40]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #2
	ldr r3, [r0, #0x30]
	adds r2, r2, r3
	ldr r3, [r2]
	bl _0806FBEE
	str r3, [r1, #0x24]
	ldr r3, [r2, #4]
	bl _0806FBEE
	str r3, [r1, #0x28]
	ldr r3, [r2, #8]
	bl _0806FBEE
	str r3, [r1, #0x2c]
	bx ip
	.align 2, 0

	thumb_func_start sub_0806FCF8
sub_0806FCF8: @ 0x0806FCF8
	mov ip, lr
	bl sub_0806FC08
	strb r3, [r1, #0x12]
	ldrb r3, [r1]
	movs r2, #3
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0

	thumb_func_start sub_0806FD0C
sub_0806FD0C: @ 0x0806FD0C
	mov ip, lr
	bl sub_0806FC08
	subs r3, #0x40
	strb r3, [r1, #0x14]
	ldrb r3, [r1]
	movs r2, #3
	orrs r3, r2
	strb r3, [r1]
	bx ip

	thumb_func_start sub_0806FD20
sub_0806FD20: @ 0x0806FD20
	mov ip, lr
	bl sub_0806FC08
	subs r3, #0x40
	strb r3, [r1, #0xe]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip

	thumb_func_start sub_0806FD34
sub_0806FD34: @ 0x0806FD34
	mov ip, lr
	bl sub_0806FC08
	strb r3, [r1, #0xf]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0

	thumb_func_start sub_0806FD48
sub_0806FD48: @ 0x0806FD48
	mov ip, lr
	bl sub_0806FC08
	strb r3, [r1, #0x1b]
	bx ip
	.align 2, 0

	thumb_func_start sub_0806FD54
sub_0806FD54: @ 0x0806FD54
	mov ip, lr
	bl sub_0806FC08
	ldrb r0, [r1, #0x18]
	cmp r0, r3
	beq _0806FD6A
	strb r3, [r1, #0x18]
	ldrb r3, [r1]
	movs r2, #0xf
	orrs r3, r2
	strb r3, [r1]
_0806FD6A:
	bx ip

	thumb_func_start sub_0806FD6C
sub_0806FD6C: @ 0x0806FD6C
	mov ip, lr
	bl sub_0806FC08
	subs r3, #0x40
	strb r3, [r1, #0xc]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip

	thumb_func_start sub_0806FD80
sub_0806FD80: @ 0x0806FD80
	mov ip, lr
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	ldr r0, _0806FD94 @ =0x04000060
	adds r0, r0, r3
	bl sub_0806FC0A
	strb r3, [r0]
	bx ip
	.align 2, 0
_0806FD94: .4byte 0x04000060

	thumb_func_start sub_0806FD98
sub_0806FD98: @ 0x0806FD98
	ldr r0, _08070044 @ =gUnknown_03007FF0
	ldr r0, [r0]
	ldr r2, _08070048 @ =0x68736D53
	ldr r3, [r0]
	subs r3, r3, r2
	cmp r3, #1
	bhi _0806FDD8
	ldrb r1, [r0, #4]
	subs r1, #1
	strb r1, [r0, #4]
	bgt _0806FDD8
	ldrb r1, [r0, #0xb]
	strb r1, [r0, #4]
	ldr r2, _0806FDDC @ =0x040000BC
	ldr r1, [r2, #8]
	lsls r1, r1, #7
	blo _0806FDBE
	ldr r1, _0806FDE0 @ =0x84400004
	str r1, [r2, #8]
_0806FDBE:
	ldr r1, [r2, #0x14]
	lsls r1, r1, #7
	blo _0806FDC8
	ldr r1, _0806FDE0 @ =0x84400004
	str r1, [r2, #0x14]
_0806FDC8:
	movs r1, #4
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
_0806FDCE:
	strh r1, [r2, #0x16]
	movs r1, #0xb6
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
	strh r1, [r2, #0x16]
_0806FDD8:
	bx lr
	.align 2, 0
_0806FDDC: .4byte 0x040000BC
_0806FDE0: .4byte 0x84400004

	thumb_func_start sub_0806FDE4
sub_0806FDE4: @ 0x0806FDE4
	ldr r2, _08070048 @ =0x68736D53
	ldr r3, [r0, #0x34]
	cmp r2, r3
	beq _0806FDEE
	bx lr
_0806FDEE:
	adds r3, #1
	str r3, [r0, #0x34]
	push {r0, lr}
	ldr r3, [r0, #0x38]
	cmp r3, #0
	beq _0806FE00
	ldr r0, [r0, #0x3c]
	bl sub_0807003C
_0806FE00:
	pop {r0}
	push {r4, r5, r6, r7}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _0806FE18
	b _0807002C
_0806FE18:
	ldr r0, _08070044 @ =gUnknown_03007FF0
	ldr r0, [r0]
	mov r8, r0
	adds r0, r7, #0
	bl sub_08070CD0
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _0806FE2C
	b _0807002C
_0806FE2C:
	ldrh r0, [r7, #0x22]
	ldrh r1, [r7, #0x20]
	adds r0, r0, r1
	b _0806FF7C
_0806FE34:
	ldrb r6, [r7, #8]
	ldr r5, [r7, #0x2c]
	movs r3, #1
	movs r4, #0
_0806FE3C:
	ldrb r0, [r5]
	movs r1, #0x80
	tst r1, r0
	bne _0806FE46
	b _0806FF58
_0806FE46:
	mov sl, r3
	orrs r4, r3
	mov fp, r4
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _0806FE7A
_0806FE52:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _0806FE6E
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	beq _0806FE74
	subs r0, #1
	strb r0, [r4, #0x10]
	bne _0806FE74
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r4]
	b _0806FE74
_0806FE6E:
	adds r0, r4, #0
	bl sub_080707CC
_0806FE74:
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _0806FE52
_0806FE7A:
	ldrb r3, [r5]
	movs r0, #0x40
	tst r0, r3
	beq _0806FEF8
	adds r0, r5, #0
	bl sub_080707E0
	movs r0, #0x80
	strb r0, [r5]
	movs r0, #2
	strb r0, [r5, #0xf]
	movs r0, #0x40
	strb r0, [r5, #0x13]
	movs r0, #0x16
	strb r0, [r5, #0x19]
	movs r0, #1
	adds r1, r5, #6
	strb r0, [r1, #0x1e]
	b _0806FEF8
_0806FEA0:
	ldr r2, [r5, #0x40]
	ldrb r1, [r2]
	cmp r1, #0x80
	bhs _0806FEAC
	ldrb r1, [r5, #7]
	b _0806FEB6
_0806FEAC:
	adds r2, #1
	str r2, [r5, #0x40]
	cmp r1, #0xbd
	blo _0806FEB6
	strb r1, [r5, #7]
_0806FEB6:
	cmp r1, #0xcf
	blo _0806FECC
	mov r0, r8
	ldr r3, [r0, #0x38]
	adds r0, r1, #0
	subs r0, #0xcf
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_0807003C
	b _0806FEF8
_0806FECC:
	cmp r1, #0xb0
	bls _0806FEEE
	adds r0, r1, #0
	subs r0, #0xb1
	strb r0, [r7, #0xa]
	mov r3, r8
	ldr r3, [r3, #0x34]
	lsls r0, r0, #2
	ldr r3, [r3, r0]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_0807003C
	ldrb r0, [r5]
	cmp r0, #0
	beq _0806FF54
	b _0806FEF8
_0806FEEE:
	ldr r0, _08070040 @ =gUnknown_081B9FD8
	subs r1, #0x80
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r5, #1]
_0806FEF8:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _0806FEA0
	subs r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #0x19]
	cmp r1, #0
	beq _0806FF54
	ldrb r0, [r5, #0x17]
	cmp r0, #0
	beq _0806FF54
	ldrb r0, [r5, #0x1c]
	cmp r0, #0
	beq _0806FF1A
	subs r0, #1
	strb r0, [r5, #0x1c]
	b _0806FF54
_0806FF1A:
	ldrb r0, [r5, #0x1a]
	adds r0, r0, r1
	strb r0, [r5, #0x1a]
	adds r1, r0, #0
	subs r0, #0x40
	lsls r0, r0, #0x18
	bpl _0806FF2E
	lsls r2, r1, #0x18
	asrs r2, r2, #0x18
	b _0806FF32
_0806FF2E:
	movs r0, #0x80
	subs r2, r0, r1
_0806FF32:
	ldrb r0, [r5, #0x17]
	muls r0, r2, r0
	asrs r2, r0, #6
	ldrb r0, [r5, #0x16]
	eors r0, r2
	lsls r0, r0, #0x18
	beq _0806FF54
	strb r2, [r5, #0x16]
	ldrb r0, [r5]
	ldrb r1, [r5, #0x18]
	cmp r1, #0
	bne _0806FF4E
	movs r1, #0xc
	b _0806FF50
_0806FF4E:
	movs r1, #3
_0806FF50:
	orrs r0, r1
	strb r0, [r5]
_0806FF54:
	mov r3, sl
	mov r4, fp
_0806FF58:
	subs r6, #1
	ble _0806FF64
	movs r0, #0x50
	adds r5, r5, r0
	lsls r3, r3, #1
	b _0806FE3C
_0806FF64:
	ldr r0, [r7, #0xc]
	adds r0, #1
	str r0, [r7, #0xc]
	cmp r4, #0
	bne _0806FF76
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r7, #4]
	b _0807002C
_0806FF76:
	str r4, [r7, #4]
	ldrh r0, [r7, #0x22]
	subs r0, #0x96
_0806FF7C:
	strh r0, [r7, #0x22]
	cmp r0, #0x96
	blo _0806FF84
	b _0806FE34
_0806FF84:
	ldrb r2, [r7, #8]
	ldr r5, [r7, #0x2c]
_0806FF88:
	ldrb r0, [r5]
	movs r1, #0x80
	tst r1, r0
	beq _08070022
	movs r1, #0xf
	tst r1, r0
	beq _08070022
	mov sb, r2
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_08070D98
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _08070018
_0806FFA6:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	bne _0806FFB6
	adds r0, r4, #0
	bl sub_080707CC
	b _08070012
_0806FFB6:
	ldrb r0, [r4, #1]
	movs r6, #7
	ands r6, r0
	ldrb r3, [r5]
	movs r0, #3
	tst r0, r3
	beq _0806FFD4
	bl sub_08070090
	cmp r6, #0
	beq _0806FFD4
	ldrb r0, [r4, #0x1d]
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0x1d]
_0806FFD4:
	ldrb r3, [r5]
	movs r0, #0xc
	tst r0, r3
	beq _08070012
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r5, r0]
	adds r2, r1, r0
	bpl _0806FFE8
	movs r2, #0
_0806FFE8:
	cmp r6, #0
	beq _08070006
	mov r0, r8
	ldr r3, [r0, #0x30]
	adds r1, r2, #0
	ldrb r2, [r5, #9]
	adds r0, r6, #0
	bl sub_0807003C
	str r0, [r4, #0x20]
	ldrb r0, [r4, #0x1d]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x1d]
	b _08070012
_08070006:
	adds r1, r2, #0
	ldrb r2, [r5, #9]
	ldr r0, [r4, #0x24]
	bl sub_08070350
	str r0, [r4, #0x20]
_08070012:
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _0806FFA6
_08070018:
	ldrb r0, [r5]
	movs r1, #0xf0
	ands r0, r1
	strb r0, [r5]
	mov r2, sb
_08070022:
	subs r2, #1
	ble _0807002C
	movs r0, #0x50
	adds r5, r5, r0
	bgt _0806FF88
_0807002C:
	ldr r0, _08070048 @ =0x68736D53
	str r0, [r7, #0x34]
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r3}

	thumb_func_start sub_0807003C
sub_0807003C: @ 0x0807003C
	bx r3
	.align 2, 0
_08070040: .4byte gUnknown_081B9FD8
_08070044: .4byte gUnknown_03007FF0
_08070048: .4byte 0x68736D53

