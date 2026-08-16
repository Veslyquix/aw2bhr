	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804FCA4
sub_0804FCA4: @ 0x0804FCA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r3, _0804FDEC @ =gUnknown_03001470
	ldr r0, _0804FDF0 @ =gUnknown_03001FBC
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
	mov sb, r6
	adds r3, #0x34
	adds r2, r2, r3
	ldrh r1, [r2]
	mov r8, r1
	bl sub_080156C4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r0, #0
	ldr r0, _0804FDF4 @ =gUnknown_084C3F70
	lsls r7, r6, #2
	adds r0, r7, r0
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r0, _0804FDF8 @ =gUnknown_084C3F78
	adds r0, r7, r0
	ldr r0, [r0]
	str r0, [sp, #8]
	adds r0, r6, #0
	mov r1, r8
	bl sub_08056E9C
	mov r4, sl
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r0, r6, #0
	mov r1, r8
	bl sub_0804BDD8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	cmp r5, #0x1b
	bne _0804FD44
	ldr r3, _0804FDFC @ =gUnknown_085D6C88
	ldr r0, _0804FE00 @ =gUnknown_020296B0
	adds r4, r7, r6
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrb r0, [r4, #0x1a]
	movs r2, #1
	ands r2, r0
	lsls r2, r2, #1
	ldr r0, _0804FE04 @ =gUnknown_03004580
	lsls r1, r6, #4
	adds r0, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, r2, r0
	adds r3, #0x10
	adds r2, r2, r3
	movs r1, #0
	ldrsh r0, [r2, r1]
	bl sub_0803B48C
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
_0804FD44:
	cmp r5, #0x1c
	bne _0804FD8A
	ldr r5, _0804FDFC @ =gUnknown_085D6C88
	ldr r0, _0804FE00 @ =gUnknown_020296B0
	adds r4, r7, r6
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrb r0, [r4, #0x1a]
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #1
	ldr r2, _0804FE04 @ =gUnknown_03004580
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
	adds r5, #0xc
	adds r1, r1, r5
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl sub_0803B48C
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
_0804FD8A:
	ldr r1, _0804FE08 @ =gUnknown_02029A10
	mov r4, r8
	lsls r3, r4, #3
	add r3, r8
	lsls r3, r3, #2
	movs r0, #0xb4
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	adds r3, r3, r0
	adds r3, r3, r1
	ldr r2, _0804FE0C @ =gUnknown_08553B28
	ldr r4, [sp]
	lsls r1, r4, #1
	mov r4, sb
	lsls r0, r4, #1
	add r0, sb
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r1, [r1]
	ldrh r0, [r3, #8]
	adds r1, r1, r0
	strh r1, [r3, #8]
	mov r2, sl
	movs r4, #0
	ldrsh r0, [r2, r4]
	ldr r4, [sp, #4]
	ldrh r2, [r4]
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r3, #0xa]
	ldr r4, [sp, #8]
	ldrh r3, [r4]
	subs r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_080155C0
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FDEC: .4byte gUnknown_03001470
_0804FDF0: .4byte gUnknown_03001FBC
_0804FDF4: .4byte gUnknown_084C3F70
_0804FDF8: .4byte gUnknown_084C3F78
_0804FDFC: .4byte gUnknown_085D6C88
_0804FE00: .4byte gUnknown_020296B0
_0804FE04: .4byte gUnknown_03004580
_0804FE08: .4byte gUnknown_02029A10
_0804FE0C: .4byte gUnknown_08553B28

