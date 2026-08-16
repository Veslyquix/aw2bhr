	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080681B8
sub_080681B8: @ 0x080681B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x34
	ldrsh r1, [r6, r0]
	movs r0, #0x36
	ldrsh r2, [r6, r0]
	adds r4, r6, #0
	adds r4, #0x4f
	ldrb r3, [r4]
	adds r7, r6, #0
	adds r7, #0x4e
	ldrb r0, [r7]
	str r0, [sp]
	movs r0, #5
	bl sub_08074234
	adds r2, r0, #0
	adds r0, r6, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	bne _08068254
	ldrh r0, [r6, #0x2c]
	subs r5, r0, #1
	mov sb, r4
	mov sl, r7
	cmp r5, #0
	blt _080682B0
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r1, r0, #0
	adds r1, #0x20
	adds r1, r1, r2
	mov r8, r1
	adds r7, r0, r2
_0806820A:
	ldr r0, _0806824C @ =0x0000010F
	cmp r8, r0
	bhi _0806823A
	ldrh r4, [r6, #0x30]
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	adds r0, r5, #0
	bl __modsi3
	lsls r0, r0, #4
	adds r4, r4, r0
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	adds r4, r4, r0
	str r4, [sp]
	movs r0, #0
	adds r1, r7, #0
	movs r2, #0x40
	ldr r3, _08068250 @ =gUnknown_08581208
	bl sub_0801BEBC
_0806823A:
	movs r1, #0x24
	rsbs r1, r1, #0
	add r8, r1
	subs r7, #0x24
	subs r5, #1
	cmp r5, #0
	bge _0806820A
	b _080682B0
	.align 2, 0
_0806824C: .4byte 0x0000010F
_08068250: .4byte gUnknown_08581208
_08068254:
	movs r5, #0
	ldrh r1, [r6, #0x2c]
	mov sb, r4
	mov sl, r7
	cmp r5, r1
	bge _080682B0
	movs r0, #0x20
	adds r0, r0, r2
	mov r8, r0
	adds r7, r2, #0
_08068268:
	ldr r0, _080682E0 @ =0x0000010F
	cmp r8, r0
	bhi _080682A2
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r4, [r0]
	subs r0, r1, r5
	subs r0, #1
	adds r1, r4, #0
	bl __modsi3
	subs r4, r4, r0
	subs r4, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0xc
	ldrh r1, [r6, #0x30]
	adds r4, r4, r1
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	adds r4, r4, r0
	str r4, [sp]
	movs r0, #0
	adds r1, r7, #0
	movs r2, #0x40
	ldr r3, _080682E4 @ =gUnknown_08581208
	bl sub_0801BEBC
_080682A2:
	movs r2, #0x24
	add r8, r2
	adds r7, #0x24
	adds r5, #1
	ldrh r1, [r6, #0x2c]
	cmp r5, r1
	blt _08068268
_080682B0:
	mov r1, sb
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r2, sl
	ldrb r2, [r2]
	cmp r0, r2
	bne _080682CE
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_080682CE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080682E0: .4byte 0x0000010F
_080682E4: .4byte gUnknown_08581208

