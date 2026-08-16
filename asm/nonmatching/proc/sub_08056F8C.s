	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08056F8C
sub_08056F8C: @ 0x08056F8C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldrh r6, [r5]
	ldrh r0, [r5, #0xa]
	cmp r0, #0
	beq _08056FDA
	movs r7, #0
	ldrh r0, [r5, #4]
	cmp r7, r0
	bge _08057012
_08056FA4:
	ldrh r4, [r5, #2]
	adds r0, r7, #1
	mov r8, r0
	cmp r4, #0
	ble _08056FD0
_08056FAE:
	ldrh r1, [r5, #6]
	adds r1, r1, r4
	lsls r0, r7, #5
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r5, #8]
	adds r0, r6, #0
	movs r3, #1
	bl sub_0805701C
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	subs r4, #1
	cmp r4, #0
	bgt _08056FAE
_08056FD0:
	mov r7, r8
	ldrh r0, [r5, #4]
	cmp r7, r0
	blt _08056FA4
	b _08057012
_08056FDA:
	movs r7, #0
	b _0805700C
_08056FDE:
	movs r4, #0
	adds r0, r7, #1
	mov r8, r0
	b _08057004
_08056FE6:
	ldrh r1, [r5, #6]
	adds r1, r1, r4
	lsls r0, r7, #5
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r5, #8]
	adds r0, r6, #0
	movs r3, #0
	bl sub_0805701C
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r4, #1
_08057004:
	ldrh r0, [r5, #2]
	cmp r4, r0
	blt _08056FE6
	mov r7, r8
_0805700C:
	ldrh r0, [r5, #4]
	cmp r7, r0
	blt _08056FDE
_08057012:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

