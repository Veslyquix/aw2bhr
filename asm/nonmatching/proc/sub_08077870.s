	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077870
sub_08077870: @ 0x08077870
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0
	mov sb, r0
	str r0, [sp]
	ldr r2, _08077934 @ =gUnknown_08499578
	mov r8, r2
	ldr r1, [r2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r5, _08077938 @ =0x01000070
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	mov r0, sb
	str r0, [sp, #4]
	add r0, sp, #4
	ldr r6, _0807793C @ =gUnknown_08499580
	ldr r1, [r6]
	adds r1, r1, r4
	adds r2, r5, #0
	bl CpuFastSet
	bl sub_08013AEC
	bl sub_08013B0C
	ldr r1, _08077940 @ =gUnknown_086145E2
	ldr r0, [r7, #0x44]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r0, _08077944 @ =gUnknown_08551A00
	ldr r0, [r0]
	movs r4, #0x9e
	subs r4, r4, r5
	lsls r4, r4, #1
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r4
	adds r2, r5, #0
	movs r3, #7
	bl sub_08071900
	ldr r0, _08077948 @ =gUnknown_08551A04
	ldr r0, [r0]
	ldr r1, [r6]
	adds r1, r1, r4
	adds r2, r5, #0
	movs r3, #7
	bl sub_08071900
	ldr r2, _0807794C @ =gUnknown_0300064C
	ldr r1, _08077950 @ =gUnknown_086145E7
	ldr r0, [r7, #0x44]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r2]
	movs r1, #0xa8
	subs r1, r1, r0
	movs r0, #0
	bl sub_08077620
	ldr r0, [r7, #0x44]
	adds r0, #1
	str r0, [r7, #0x44]
	cmp r0, #5
	bne _08077924
	movs r0, #0
	bl sub_080638D0
	mov r0, sb
	str r0, [r7, #0x44]
	movs r0, #0
	bl sub_080752D8
	movs r0, #0
	bl sub_08074EEC
	adds r0, r7, #0
	bl Proc_Break
_08077924:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077934: .4byte gUnknown_08499578
_08077938: .4byte 0x01000070
_0807793C: .4byte gUnknown_08499580
_08077940: .4byte gUnknown_086145E2
_08077944: .4byte gUnknown_08551A00
_08077948: .4byte gUnknown_08551A04
_0807794C: .4byte gUnknown_0300064C
_08077950: .4byte gUnknown_086145E7

