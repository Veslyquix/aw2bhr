	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801FAC4
sub_0801FAC4: @ 0x0801FAC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r4, [sp, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov ip, r4
	movs r5, #1
	cmp r2, #1
	beq _0801FB0C
	cmp r2, #1
	bgt _0801FB00
	cmp r2, #0
	beq _0801FB78
	b _0801FCC6
_0801FB00:
	cmp r0, #2
	beq _0801FBF0
	cmp r0, #3
	bne _0801FB0A
	b _0801FC5C
_0801FB0A:
	b _0801FCC6
_0801FB0C:
	mov r2, sb
	mov r1, r8
	subs r0, r2, r1
	cmp r2, r0
	bgt _0801FB18
	b _0801FCC6
_0801FB18:
	cmp r2, #0
	bge _0801FB1E
	b _0801FCC6
_0801FB1E:
	mov r0, sl
	adds r0, #1
	subs r1, r0, r5
	lsls r0, r5, #1
	subs r0, #1
	cmp r1, #0
	bge _0801FB30
	adds r0, r0, r1
	movs r1, #0
_0801FB30:
	adds r4, r1, r0
	ldr r3, _0801FB70 @ =gUnknown_08499590
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r4, r0
	ble _0801FB3E
	adds r4, r0, #0
_0801FB3E:
	adds r3, r1, #0
	adds r5, #1
	subs r1, r2, #1
	mov r7, sb
	mov r0, r8
	subs r6, r7, r0
	cmp r3, r4
	bge _0801FB62
	lsls r0, r2, #2
	ldr r7, _0801FB74 @ =gUnknown_03003340
	adds r2, r0, r7
_0801FB54:
	ldr r0, [r2]
	adds r0, r0, r3
	mov r7, ip
	strb r7, [r0]
	adds r3, #1
	cmp r3, r4
	blt _0801FB54
_0801FB62:
	adds r2, r1, #0
	cmp r2, r6
	bgt _0801FB6A
	b _0801FCC6
_0801FB6A:
	cmp r2, #0
	bge _0801FB1E
	b _0801FCC6
	.align 2, 0
_0801FB70: .4byte gUnknown_08499590
_0801FB74: .4byte gUnknown_03003340
_0801FB78:
	mov r2, sb
	mov r1, r8
	adds r0, r2, r1
	cmp r2, r0
	blt _0801FB84
	b _0801FCC6
_0801FB84:
	ldr r6, _0801FBE8 @ =gUnknown_08499590
	ldr r0, [r6]
	ldrh r0, [r0, #2]
	cmp r2, r0
	blt _0801FB90
	b _0801FCC6
_0801FB90:
	adds r7, r6, #0
_0801FB92:
	mov r0, sl
	adds r0, #1
	subs r1, r0, r5
	lsls r0, r5, #1
	subs r0, #1
	cmp r1, #0
	bge _0801FBA4
	adds r0, r0, r1
	movs r1, #0
_0801FBA4:
	adds r4, r1, r0
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r4, r0
	ble _0801FBB0
	adds r4, r0, #0
_0801FBB0:
	adds r3, r1, #0
	adds r5, #1
	adds r1, r2, #1
	mov r6, sb
	add r6, r8
	str r6, [sp, #4]
	cmp r3, r4
	bge _0801FBD4
	lsls r0, r2, #2
	ldr r6, _0801FBEC @ =gUnknown_03003340
	adds r2, r0, r6
_0801FBC6:
	ldr r0, [r2]
	adds r0, r0, r3
	mov r6, ip
	strb r6, [r0]
	adds r3, #1
	cmp r3, r4
	blt _0801FBC6
_0801FBD4:
	adds r2, r1, #0
	ldr r0, [sp, #4]
	cmp r2, r0
	bge _0801FCC6
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	cmp r2, r0
	blt _0801FB92
	b _0801FCC6
	.align 2, 0
_0801FBE8: .4byte gUnknown_08499590
_0801FBEC: .4byte gUnknown_03003340
_0801FBF0:
	mov r3, sl
	mov r1, r8
	subs r0, r3, r1
	cmp r3, r0
	ble _0801FCC6
	cmp r3, #0
	blt _0801FCC6
_0801FBFE:
	mov r0, sb
	adds r0, #1
	subs r2, r0, r5
	lsls r0, r5, #1
	subs r0, #1
	cmp r2, #0
	bge _0801FC10
	adds r0, r0, r2
	movs r2, #0
_0801FC10:
	adds r1, r2, r0
	ldr r4, _0801FC54 @ =gUnknown_08499590
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	cmp r1, r0
	ble _0801FC1E
	adds r1, r0, #0
_0801FC1E:
	adds r5, #1
	subs r4, r3, #1
	mov r6, sl
	mov r7, r8
	subs r6, r6, r7
	str r6, [sp]
	cmp r2, r1
	bge _0801FC44
	lsls r0, r2, #2
	ldr r7, _0801FC58 @ =gUnknown_03003340
	adds r6, r0, r7
	subs r2, r1, r2
_0801FC36:
	ldm r6!, {r0}
	adds r0, r0, r3
	mov r1, ip
	strb r1, [r0]
	subs r2, #1
	cmp r2, #0
	bne _0801FC36
_0801FC44:
	adds r3, r4, #0
	ldr r4, [sp]
	cmp r3, r4
	ble _0801FCC6
	cmp r3, #0
	bge _0801FBFE
	b _0801FCC6
	.align 2, 0
_0801FC54: .4byte gUnknown_08499590
_0801FC58: .4byte gUnknown_03003340
_0801FC5C:
	mov r3, sl
	mov r6, r8
	adds r0, r3, r6
	cmp r3, r0
	bge _0801FCC6
	ldr r2, _0801FCD8 @ =gUnknown_08499590
	ldr r0, [r2]
	ldrh r0, [r0]
	cmp r3, r0
	bge _0801FCC6
_0801FC70:
	mov r0, sb
	adds r0, #1
	subs r2, r0, r5
	lsls r0, r5, #1
	subs r0, #1
	cmp r2, #0
	bge _0801FC82
	adds r0, r0, r2
	movs r2, #0
_0801FC82:
	adds r1, r2, r0
	ldr r7, _0801FCD8 @ =gUnknown_08499590
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	cmp r1, r0
	ble _0801FC90
	adds r1, r0, #0
_0801FC90:
	adds r4, r3, #1
	adds r5, #1
	mov r0, sl
	add r0, r8
	str r0, [sp]
	cmp r2, r1
	bge _0801FCB4
	lsls r0, r2, #2
	ldr r7, _0801FCDC @ =gUnknown_03003340
	adds r6, r0, r7
	subs r2, r1, r2
_0801FCA6:
	ldm r6!, {r0}
	adds r0, r0, r3
	mov r1, ip
	strb r1, [r0]
	subs r2, #1
	cmp r2, #0
	bne _0801FCA6
_0801FCB4:
	adds r3, r4, #0
	ldr r6, [sp]
	cmp r4, r6
	bge _0801FCC6
	ldr r7, _0801FCD8 @ =gUnknown_08499590
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r4, r0
	blt _0801FC70
_0801FCC6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FCD8: .4byte gUnknown_08499590
_0801FCDC: .4byte gUnknown_03003340

