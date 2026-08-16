	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804D0FC
sub_0804D0FC: @ 0x0804D0FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _0804D19C @ =gUnknown_03001470
	ldr r4, _0804D1A0 @ =gUnknown_0813606C
	ldr r0, [r4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #5
	adds r1, r3, #0
	adds r1, #0x30
	adds r1, r2, r1
	ldrh r5, [r1]
	adds r3, #0x34
	adds r2, r2, r3
	ldrh r7, [r2]
	bl sub_080156C4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r4
	cmp r0, #2
	bne _0804D16C
	ldr r2, _0804D1A4 @ =gUnknown_020296B0
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r6, r1, r2
	ldrh r0, [r6, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r2, #0xc
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, #0xff
	beq _0804D166
	ldr r1, _0804D1A8 @ =gUnknown_02029A10
	lsls r4, r7, #3
	adds r4, r4, r7
	lsls r4, r4, #2
	movs r0, #0xb4
	muls r0, r5, r0
	adds r4, r4, r0
	adds r4, r4, r1
	ldrh r1, [r4, #0x1e]
	adds r0, r5, #0
	bl sub_080505A4
	ldrh r0, [r4, #0x1e]
	adds r0, #1
	strh r0, [r4, #0x1e]
_0804D166:
	ldrh r0, [r6, #0x18]
	adds r0, #1
	strh r0, [r6, #0x18]
_0804D16C:
	mov r0, r8
	ldr r4, [r0]
	movs r1, #0
	ldrsh r2, [r4, r1]
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_0804CA98
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_0804DC5C
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_08056E9C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D19C: .4byte gUnknown_03001470
_0804D1A0: .4byte gUnknown_0813606C
_0804D1A4: .4byte gUnknown_020296B0
_0804D1A8: .4byte gUnknown_02029A10

