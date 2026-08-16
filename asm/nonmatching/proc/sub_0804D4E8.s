	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804D4E8
sub_0804D4E8: @ 0x0804D4E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _0804D5C0 @ =gUnknown_03001470
	ldr r4, _0804D5C4 @ =gUnknown_08136070
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
	bne _0804D592
	ldr r2, _0804D5C8 @ =gUnknown_020296B0
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
	beq _0804D58C
	ldr r1, _0804D5CC @ =gUnknown_02029A10
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
	ldr r4, _0804D5D0 @ =gUnknown_085D6C88
	ldrb r0, [r6, #0x1a]
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #1
	ldr r2, _0804D5D4 @ =gUnknown_03004580
	lsls r3, r5, #4
	adds r0, r2, #4
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r2, #2
	adds r3, r3, r2
	ldrh r2, [r3]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r4, #0xc
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl sub_0803B48C
	ldrb r0, [r6, #0x1a]
	adds r0, #1
	strb r0, [r6, #0x1a]
_0804D58C:
	ldrh r0, [r6, #0x18]
	adds r0, #1
	strh r0, [r6, #0x18]
_0804D592:
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
_0804D5C0: .4byte gUnknown_03001470
_0804D5C4: .4byte gUnknown_08136070
_0804D5C8: .4byte gUnknown_020296B0
_0804D5CC: .4byte gUnknown_02029A10
_0804D5D0: .4byte gUnknown_085D6C88
_0804D5D4: .4byte gUnknown_03004580

