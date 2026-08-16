	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08050F24
sub_08050F24: @ 0x08050F24
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _08050FD4 @ =gUnknown_0300453C
	strh r5, [r0]
	ldr r0, _08050FD8 @ =gUnknown_0300451C
	strh r1, [r0]
	ldr r2, _08050FDC @ =gUnknown_08552178
	lsls r0, r5, #2
	adds r0, r0, r5
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r4, r0, #3
	subs r4, r4, r0
	adds r4, #1
	ldr r0, _08050FE0 @ =gUnknown_08553640
	mov sb, r0
	ldr r2, _08050FE4 @ =gUnknown_03004580
	movs r0, #1
	adds r3, r5, #0
	eors r3, r0
	lsls r1, r3, #4
	adds r0, r2, #4
	adds r0, r1, r0
	ldrh r0, [r0]
	mov r8, r0
	ldr r6, _08050FE8 @ =gUnknown_085D6A48
	adds r2, #2
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #0x10]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	ldr r1, _08050FEC @ =gUnknown_085535B8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _08050FF0 @ =gUnknown_02029A00
	lsls r3, r3, #3
	adds r2, r3, r1
	ldr r2, [r2]
	adds r1, #4
	adds r3, r3, r1
	ldr r3, [r3]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r1, #1
	bl sub_08015410
	ldr r3, _08050FF4 @ =gUnknown_020298E0
	lsls r2, r5, #3
	adds r2, r2, r5
	lsls r2, r2, #4
	adds r1, r2, r3
	ldrh r1, [r1, #0x16]
	subs r1, #1
	lsls r1, r1, #1
	adds r1, r1, r2
	adds r3, #2
	adds r1, r1, r3
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050FD4: .4byte gUnknown_0300453C
_08050FD8: .4byte gUnknown_0300451C
_08050FDC: .4byte gUnknown_08552178
_08050FE0: .4byte gUnknown_08553640
_08050FE4: .4byte gUnknown_03004580
_08050FE8: .4byte gUnknown_085D6A48
_08050FEC: .4byte gUnknown_085535B8
_08050FF0: .4byte gUnknown_02029A00
_08050FF4: .4byte gUnknown_020298E0

