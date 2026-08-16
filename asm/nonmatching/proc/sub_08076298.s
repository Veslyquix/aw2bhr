	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076298
sub_08076298: @ 0x08076298
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r4, #0
	str r4, [sp]
	ldr r0, _08076320 @ =gUnknown_08499578
	mov r8, r0
	ldr r1, [r0]
	movs r5, #0x80
	lsls r5, r5, #3
	adds r1, r1, r5
	ldr r6, _08076324 @ =0x01000040
	mov r0, sp
	adds r2, r6, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _08076328 @ =gUnknown_08499580
	mov sb, r1
	ldr r1, [r1]
	adds r1, r1, r5
	adds r2, r6, #0
	bl CpuFastSet
	bl sub_08013AEC
	bl sub_08013B0C
	ldr r1, _0807632C @ =gUnknown_0861445C
	ldr r0, [r7, #0x40]
	adds r0, r0, r1
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r0, r7, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0807633C
	ldr r0, _08076330 @ =gUnknown_08551A00
	ldr r4, _08076334 @ =0x0000014D
	subs r4, r4, r6
	lsls r4, r4, #1
	ldr r0, [r0]
	adds r0, r0, r4
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r5
	adds r2, r6, #0
	movs r3, #4
	bl sub_08071900
	ldr r0, _08076338 @ =gUnknown_08551A04
	ldr r0, [r0]
	adds r0, r0, r4
	mov r2, sb
	ldr r1, [r2]
	adds r1, r1, r5
	adds r2, r6, #0
	movs r3, #4
	bl sub_08071900
	b _0807636E
	.align 2, 0
_08076320: .4byte gUnknown_08499578
_08076324: .4byte 0x01000040
_08076328: .4byte gUnknown_08499580
_0807632C: .4byte gUnknown_0861445C
_08076330: .4byte gUnknown_08551A00
_08076334: .4byte 0x0000014D
_08076338: .4byte gUnknown_08551A04
_0807633C:
	ldr r0, _08076390 @ =gUnknown_08551A00
	ldr r0, [r0]
	movs r5, #0xa0
	lsls r5, r5, #2
	adds r0, r0, r5
	ldr r4, _08076394 @ =0x0000021E
	subs r4, r4, r6
	lsls r4, r4, #1
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r4
	adds r2, r6, #0
	movs r3, #4
	bl sub_08071900
	ldr r0, _08076398 @ =gUnknown_08551A04
	ldr r0, [r0]
	adds r0, r0, r5
	mov r2, sb
	ldr r1, [r2]
	adds r1, r1, r4
	adds r2, r6, #0
	movs r3, #4
	bl sub_08071900
_0807636E:
	ldr r0, [r7, #0x40]
	adds r0, #1
	str r0, [r7, #0x40]
	cmp r0, #4
	bne _08076382
	movs r0, #0
	str r0, [r7, #0x40]
	adds r0, r7, #0
	bl Proc_Break
_08076382:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076390: .4byte gUnknown_08551A00
_08076394: .4byte 0x0000021E
_08076398: .4byte gUnknown_08551A04

