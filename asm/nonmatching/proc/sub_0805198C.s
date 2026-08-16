	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805198C
sub_0805198C: @ 0x0805198C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _08051A24 @ =gUnknown_0300453C
	strh r3, [r0]
	ldr r0, _08051A28 @ =gUnknown_0300451C
	strh r4, [r0]
	ldr r2, _08051A2C @ =gUnknown_085D6A48
	ldr r0, _08051A30 @ =gUnknown_03004580
	lsls r1, r3, #4
	adds r0, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	ldr r2, _08051A34 @ =gUnknown_085D6EC8
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, #0
	beq _08051A16
	ldr r1, _08051A38 @ =gUnknown_08552178
	lsls r4, r4, #1
	mov r8, r4
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #1
	add r0, r8
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r4, r0, #3
	subs r4, r4, r0
	adds r4, #3
	ldr r0, _08051A3C @ =gUnknown_0855368C
	ldr r6, _08051A40 @ =gUnknown_020297C0
	lsls r5, r3, #3
	adds r5, r5, r3
	lsls r5, r5, #2
	adds r1, r6, #0
	adds r1, #0x18
	adds r1, r5, r1
	ldr r2, [r1]
	adds r1, r6, #0
	adds r1, #0x20
	adds r1, r5, r1
	ldr r3, [r1]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r1, #1
	bl sub_08015410
	add r8, r5
	adds r6, #2
	add r8, r6
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, r8
	strh r0, [r1]
_08051A16:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08051A24: .4byte gUnknown_0300453C
_08051A28: .4byte gUnknown_0300451C
_08051A2C: .4byte gUnknown_085D6A48
_08051A30: .4byte gUnknown_03004580
_08051A34: .4byte gUnknown_085D6EC8
_08051A38: .4byte gUnknown_08552178
_08051A3C: .4byte gUnknown_0855368C
_08051A40: .4byte gUnknown_020297C0

