	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049944
sub_08049944: @ 0x08049944
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r4, [sp, #0x20]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	cmp r5, #0
	beq _08049982
	ldr r0, _080499A4 @ =gUnknown_0849957C
	ldr r0, [r0]
	subs r1, r7, #5
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #2
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	mov r2, r8
	movs r3, #6
	bl sub_08012BC8
_08049982:
	cmp r6, #0
	bne _080499A8
	cmp r5, #0
	beq _080499E4
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r2, _080499A4 @ =gUnknown_0849957C
	ldr r2, [r2]
	str r4, [sp]
	str r6, [sp, #4]
	movs r3, #0
	bl sub_08014B0C
	b _080499E4
	.align 2, 0
_080499A4: .4byte gUnknown_0849957C
_080499A8:
	movs r1, #0xa
	movs r2, #0
	cmp r6, #0xa
	blo _080499C6
_080499B0:
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #0x11
	lsrs r1, r0, #0x10
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #9
	bhi _080499C6
	cmp r6, r1
	bhs _080499B0
_080499C6:
	cmp r5, #0
	beq _080499E4
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r2, _080499F4 @ =gUnknown_0849957C
	ldr r2, [r2]
	str r4, [sp]
	movs r3, #0
	str r3, [sp, #4]
	adds r3, r6, #0
	bl sub_08014B0C
_080499E4:
	bl sub_08013AFC
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080499F4: .4byte gUnknown_0849957C

