	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035BC4
sub_08035BC4: @ 0x08035BC4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x10
	lsrs r1, r0, #0x10
	mov r8, r1
	asrs r6, r0, #0x10
	ldr r2, _08035C78 @ =gUnknown_08499590
	mov sb, r2
	ldr r1, [r2]
	movs r2, #4
	ldrsh r0, [r1, r2]
	subs r0, r6, r0
	cmp r0, #0xef
	bhi _08035C6A
	lsls r0, r7, #0x10
	asrs r5, r0, #0x10
	movs r2, #6
	ldrsh r0, [r1, r2]
	subs r0, r5, r0
	cmp r0, #0
	blt _08035C6A
	cmp r0, #0x9f
	bgt _08035C6A
	ldr r0, _08035C7C @ =gUnknown_0849BDE0
	ldr r2, _08035C80 @ =gUnknown_0849BFD8
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r1, #2
	str r1, [sp]
	movs r1, #5
	bl sub_08015438
	adds r4, r0, #0
	lsls r4, r4, #0x18
	ldr r1, _08035C84 @ =gUnknown_03001470
	asrs r4, r4, #0x18
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #5
	adds r0, r0, r1
	mov r1, r8
	strh r1, [r0, #0x1e]
	strh r7, [r0, #0x20]
	mov r2, sb
	ldr r0, [r2]
	ldrh r1, [r0, #4]
	subs r1, r6, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r0, #6]
	subs r2, r5, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_080155C0
	add r0, sp, #4
	adds r1, r4, #0
	bl sub_08015638
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	ldr r0, _08035C88 @ =0xFFFFFC00
	ands r0, r2
	movs r3, #0xbb
	lsls r3, r3, #1
	orrs r0, r3
	ldr r3, _08035C8C @ =0xFFFF0FFF
	ands r0, r3
	movs r3, #0x80
	lsls r3, r3, #8
	adds r2, r0, #0
	orrs r2, r3
	adds r0, r4, #0
	bl sub_08015608
_08035C6A:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035C78: .4byte gUnknown_08499590
_08035C7C: .4byte gUnknown_0849BDE0
_08035C80: .4byte gUnknown_0849BFD8
_08035C84: .4byte gUnknown_03001470
_08035C88: .4byte 0xFFFFFC00
_08035C8C: .4byte 0xFFFF0FFF

