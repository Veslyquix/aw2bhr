	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F0EC
sub_0806F0EC: @ 0x0806F0EC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806F11C @ =gpKeySt
	ldr r0, [r0]
	ldrh r2, [r0, #4]
	ldrh r3, [r0, #2]
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0806F120
	movs r0, #0x66
	bl sub_0803B4DC
	ldr r0, [r5, #0x44]
	adds r0, #0x48
	movs r1, #1
	strb r1, [r0]
	bl sub_0803B5E8
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0806F146
	.align 2, 0
_0806F11C: .4byte gpKeySt
_0806F120:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0806F160
	movs r0, #0x66
	bl sub_0803B4DC
	ldr r1, _0806F150 @ =gUnknown_0202F2CC
	ldr r0, [r5, #0x2c]
	str r0, [r1]
	ldr r1, _0806F154 @ =gUnknown_0202F2D0
	ldr r0, [r5, #0x30]
	str r0, [r1]
	ldr r1, _0806F158 @ =gUnknown_0202F2D4
	ldrh r0, [r5, #0x34]
	strh r0, [r1]
	ldr r1, _0806F15C @ =gUnknown_0202F2D6
	ldrh r0, [r5, #0x36]
	strh r0, [r1]
_0806F146:
	adds r0, r5, #0
	bl Proc_Break
	b _0806F274
	.align 2, 0
_0806F150: .4byte gUnknown_0202F2CC
_0806F154: .4byte gUnknown_0202F2D0
_0806F158: .4byte gUnknown_0202F2D4
_0806F15C: .4byte gUnknown_0202F2D6
_0806F160:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0806F1D4
	ldr r4, _0806F1AC @ =gUnknown_08582764
	ldr r0, [r5, #0x30]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #2]
	ldr r0, [r5, #0x2c]
	cmp r1, r0
	beq _0806F1D4
	movs r0, #0x71
	bl sub_0803B4DC
	ldr r0, [r5, #0x3c]
	adds r0, #0x48
	movs r1, #1
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_0806EB28
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _0806F1B4
	ldr r0, _0806F1B0 @ =gUnknown_08582E54
	adds r1, r5, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	ldr r0, [r5, #0x30]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	str r0, [r1, #0x58]
	str r0, [r5, #0x2c]
	b _0806F274
	.align 2, 0
_0806F1AC: .4byte gUnknown_08582764
_0806F1B0: .4byte gUnknown_08582E54
_0806F1B4:
	ldr r0, _0806F1D0 @ =gUnknown_08582C5C
	adds r1, r5, #0
	bl Proc_Start
	ldr r0, [r5, #0x30]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	str r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0803B524
	b _0806F274
	.align 2, 0
_0806F1D0: .4byte gUnknown_08582C5C
_0806F1D4:
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	beq _0806F218
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _0806F218
	movs r0, #0x66
	bl sub_0803B4DC
	ldr r0, [r5, #0x40]
	adds r0, #0x48
	movs r4, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, _0806F210 @ =gUnknown_08582E54
	adds r1, r5, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x58]
	str r4, [r5, #0x2c]
	ldr r0, _0806F214 @ =gUnknown_08582C3C
	adds r1, r5, #0
	bl Proc_Start
	b _0806F274
	.align 2, 0
_0806F210: .4byte gUnknown_08582E54
_0806F214: .4byte gUnknown_08582C3C
_0806F218:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0806F246
	ldr r0, [r5, #0x30]
	subs r0, #1
	str r0, [r5, #0x30]
	cmp r0, #0
	bne _0806F22E
	movs r0, #0x2e
	str r0, [r5, #0x30]
_0806F22E:
	movs r0, #1
	bl sub_0806E8E4
	adds r0, r5, #0
	bl sub_0806F0A0
	ldr r1, [r5, #0x30]
	movs r0, #1
	adds r2, r5, #0
	bl sub_0806E7C0
	b _0806F274
_0806F246:
	movs r0, #0x10
	ands r3, r0
	cmp r3, #0
	beq _0806F274
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	cmp r0, #0x2f
	bne _0806F25C
	movs r0, #1
	str r0, [r5, #0x30]
_0806F25C:
	movs r0, #0
	bl sub_0806E8E4
	adds r0, r5, #0
	bl sub_0806F0A0
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [r5, #0x30]
	adds r2, r5, #0
	bl sub_0806E7C0
_0806F274:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

