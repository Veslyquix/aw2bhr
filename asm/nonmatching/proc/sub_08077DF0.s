	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077DF0
sub_08077DF0: @ 0x08077DF0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r6, _08077E84 @ =gUnknown_08499578
	ldr r0, [r6]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r0, r4
	movs r1, #0x1e
	movs r2, #7
	movs r3, #0
	bl sub_08071918
	ldr r0, _08077E88 @ =gUnknown_08499580
	mov r8, r0
	ldr r0, [r0]
	adds r0, r0, r4
	movs r1, #0x1e
	movs r2, #7
	movs r3, #0
	bl sub_08071918
	bl sub_08013AEC
	bl sub_08013B0C
	ldr r1, _08077E8C @ =gUnknown_086145D8
	ldr r0, [r7, #0x44]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r0, _08077E90 @ =gUnknown_08551A00
	ldr r0, [r0]
	movs r4, #0x9e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, [r6]
	adds r1, r1, r4
	adds r2, r5, #0
	movs r3, #7
	bl sub_08071900
	ldr r0, _08077E94 @ =gUnknown_08551A04
	ldr r0, [r0]
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r4
	adds r2, r5, #0
	movs r3, #7
	bl sub_08071900
	ldr r0, _08077E98 @ =gUnknown_0300064C
	ldr r0, [r0]
	movs r1, #0xa8
	subs r1, r1, r0
	movs r0, #0
	bl sub_08077620
	ldr r0, [r7, #0x44]
	adds r0, #1
	str r0, [r7, #0x44]
	cmp r0, #5
	bne _08077E7A
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	bl Proc_Break
_08077E7A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077E84: .4byte gUnknown_08499578
_08077E88: .4byte gUnknown_08499580
_08077E8C: .4byte gUnknown_086145D8
_08077E90: .4byte gUnknown_08551A00
_08077E94: .4byte gUnknown_08551A04
_08077E98: .4byte gUnknown_0300064C

