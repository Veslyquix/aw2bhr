	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E594
sub_0803E594: @ 0x0803E594
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	str r1, [sp, #4]
	mov sl, r2
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	blt _0803E5E0
	lsls r7, r5, #0x10
	lsls r6, r2, #0x10
_0803E5B2:
	ldr r0, _0803E6BC @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r4, #1
	ldr r3, _0803E6C0 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	adds r1, #0x12
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803E5DA
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	adds r2, r0, #0
	lsrs r0, r7, #0x10
	lsrs r3, r6, #0x10
	bl sub_0803E560
_0803E5DA:
	subs r4, #1
	cmp r4, #0
	bge _0803E5B2
_0803E5E0:
	ldr r4, [sp, #4]
	ldr r1, _0803E6BC @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0]
	cmp r5, r0
	bge _0803E62A
	adds r6, r1, #0
	lsls r0, r4, #1
	mov sb, r0
	lsls r2, r4, #0x10
	mov r8, r2
	mov r3, sl
	lsls r7, r3, #0x10
_0803E5FA:
	ldr r1, [r6]
	ldr r2, _0803E6C0 @ =0x0000417A
	adds r0, r1, r2
	add r0, sb
	ldrh r0, [r0]
	adds r0, r0, r5
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803E620
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	mov r3, r8
	lsrs r1, r3, #0x10
	lsrs r3, r7, #0x10
	bl sub_0803E560
_0803E620:
	adds r5, #1
	ldr r0, [r6]
	ldrh r0, [r0]
	cmp r5, r0
	blt _0803E5FA
_0803E62A:
	ldr r5, [sp]
	ldr r1, _0803E6BC @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r4, r0
	bge _0803E672
	adds r6, r1, #0
	lsls r0, r5, #0x10
	mov r8, r0
	mov r2, sl
	lsls r7, r2, #0x10
_0803E640:
	ldr r1, [r6]
	lsls r2, r4, #1
	ldr r3, _0803E6C0 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	adds r1, #0x12
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803E668
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	adds r2, r0, #0
	mov r3, r8
	lsrs r0, r3, #0x10
	lsrs r3, r7, #0x10
	bl sub_0803E560
_0803E668:
	adds r4, #1
	ldr r0, [r6]
	ldrh r0, [r0, #2]
	cmp r4, r0
	blt _0803E640
_0803E672:
	ldr r4, [sp, #4]
	cmp r5, #0
	blt _0803E6AC
	lsls r7, r4, #1
	lsls r6, r4, #0x10
	mov r0, sl
	lsls r4, r0, #0x10
_0803E680:
	ldr r0, _0803E6BC @ =gUnknown_08499590
	ldr r1, [r0]
	ldr r2, _0803E6C0 @ =0x0000417A
	adds r0, r1, r2
	adds r0, r0, r7
	ldrh r0, [r0]
	adds r0, r0, r5
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803E6A6
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	lsrs r1, r6, #0x10
	lsrs r3, r4, #0x10
	bl sub_0803E560
_0803E6A6:
	subs r5, #1
	cmp r5, #0
	bge _0803E680
_0803E6AC:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E6BC: .4byte gUnknown_08499590
_0803E6C0: .4byte 0x0000417A

