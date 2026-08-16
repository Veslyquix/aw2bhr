	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080577E4
sub_080577E4: @ 0x080577E4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	movs r4, #1
	ands r4, r5
	ldr r0, _08057850 @ =gUnknown_02029B78
	lsls r4, r4, #1
	adds r0, r4, r0
	ldrh r0, [r0]
	adds r0, #9
	movs r1, #0xa
	bl __divsi3
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	ldr r2, _08057854 @ =gUnknown_08553A28
	adds r1, r1, r2
	movs r2, #0
	ldrsb r2, [r1, r2]
	mov r3, r8
	ldrh r3, [r3]
	adds r2, r2, r3
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r5, r8
	ldrh r5, [r5, #2]
	adds r1, r1, r5
	lsls r1, r1, #5
	adds r2, r2, r1
	lsls r2, r2, #1
	adds r6, r6, r2
	ldr r1, _08057858 @ =gUnknown_08553AD8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805785C @ =gUnknown_08562124
	adds r4, r4, r0
	ldrh r2, [r4]
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x10
	adds r0, r6, #0
	bl sub_080718F8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08057850: .4byte gUnknown_02029B78
_08057854: .4byte gUnknown_08553A28
_08057858: .4byte gUnknown_08553AD8
_0805785C: .4byte gUnknown_08562124

