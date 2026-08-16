	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077954
sub_08077954: @ 0x08077954
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0
	mov sb, r0
	str r0, [sp]
	ldr r2, _080779F8 @ =gUnknown_08499578
	mov r8, r2
	ldr r1, [r2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r5, _080779FC @ =0x01000070
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	mov r0, sb
	str r0, [sp, #4]
	add r0, sp, #4
	ldr r6, _08077A00 @ =gUnknown_08499580
	ldr r1, [r6]
	adds r1, r1, r4
	adds r2, r5, #0
	bl CpuFastSet
	bl sub_08013AEC
	bl sub_08013B0C
	ldr r1, _08077A04 @ =gUnknown_086145E2
	ldr r0, [r7, #0x44]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r0, _08077A08 @ =gUnknown_08551A00
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
	ldr r0, _08077A0C @ =gUnknown_08551A04
	ldr r0, [r0]
	ldr r1, [r6]
	adds r1, r1, r4
	adds r2, r5, #0
	movs r3, #7
	bl sub_08071900
	ldr r0, _08077A10 @ =gUnknown_0300064C
	ldr r0, [r0]
	movs r1, #0xa8
	subs r1, r1, r0
	movs r0, #0
	bl sub_08077620
	ldr r0, [r7, #0x44]
	adds r0, #1
	str r0, [r7, #0x44]
	cmp r0, #5
	bne _080779EA
	mov r0, sb
	str r0, [r7, #0x44]
	adds r0, r7, #0
	bl Proc_Break
_080779EA:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080779F8: .4byte gUnknown_08499578
_080779FC: .4byte 0x01000070
_08077A00: .4byte gUnknown_08499580
_08077A04: .4byte gUnknown_086145E2
_08077A08: .4byte gUnknown_08551A00
_08077A0C: .4byte gUnknown_08551A04
_08077A10: .4byte gUnknown_0300064C

