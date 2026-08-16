	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804E7A8
sub_0804E7A8: @ 0x0804E7A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r3, _0804E8C4 @ =gUnknown_03001470
	ldr r0, _0804E8C8 @ =gUnknown_03001FBC
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #5
	adds r1, r3, #0
	adds r1, #0x30
	adds r1, r2, r1
	ldrh r6, [r1]
	mov r8, r6
	adds r3, #0x34
	adds r2, r2, r3
	ldrh r1, [r2]
	adds r7, r1, #0
	bl sub_080156C4
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_08056E9C
	mov r3, sl
	movs r0, #0
	ldrsh r2, [r3, r0]
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_0804BDD8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _0804E8CC @ =gUnknown_084C3F70
	lsls r5, r6, #2
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _0804E8D0 @ =gUnknown_084C3F78
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [sp, #4]
	cmp r4, #0x1c
	bne _0804E852
	ldr r0, _0804E8D4 @ =gUnknown_020296B0
	adds r4, r5, r6
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrb r0, [r4, #0x1a]
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #1
	ldr r2, _0804E8D8 @ =gUnknown_03004580
	lsls r3, r6, #4
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
	ldr r2, _0804E8DC @ =gUnknown_085D6C94
	adds r1, r1, r2
	movs r3, #0
	ldrsh r0, [r1, r3]
	bl sub_0803B48C
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
_0804E852:
	ldr r1, _0804E8E0 @ =gUnknown_02029A10
	lsls r3, r7, #3
	adds r3, r3, r7
	lsls r3, r3, #2
	movs r0, #0xb4
	mov r4, r8
	muls r4, r0, r4
	adds r0, r4, #0
	adds r3, r3, r0
	adds r3, r3, r1
	ldr r2, _0804E8E4 @ =gUnknown_08553B28
	mov r0, sb
	lsls r1, r0, #1
	mov r4, r8
	lsls r0, r4, #1
	add r0, r8
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r1, [r1]
	ldrh r0, [r3, #8]
	adds r1, r1, r0
	strh r1, [r3, #8]
	ldr r2, _0804E8E8 @ =gUnknown_085644D4
	ldr r0, _0804E8EC @ =gUnknown_02028E5C
	adds r0, r5, r0
	ldrh r0, [r0, #2]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r2, [r3, #0xa]
	ldrh r0, [r0]
	subs r2, r2, r0
	strh r2, [r3, #0xa]
	ldr r3, [sp]
	ldrh r0, [r3]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	ldr r4, [sp, #4]
	ldrh r0, [r4]
	subs r2, r2, r0
	lsls r2, r2, #0x10
	mov r3, sl
	movs r4, #0
	ldrsh r0, [r3, r4]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl sub_080155C0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E8C4: .4byte gUnknown_03001470
_0804E8C8: .4byte gUnknown_03001FBC
_0804E8CC: .4byte gUnknown_084C3F70
_0804E8D0: .4byte gUnknown_084C3F78
_0804E8D4: .4byte gUnknown_020296B0
_0804E8D8: .4byte gUnknown_03004580
_0804E8DC: .4byte gUnknown_085D6C94
_0804E8E0: .4byte gUnknown_02029A10
_0804E8E4: .4byte gUnknown_08553B28
_0804E8E8: .4byte gUnknown_085644D4
_0804E8EC: .4byte gUnknown_02028E5C

