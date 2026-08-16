	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080620FC
sub_080620FC: @ 0x080620FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r0, #0
	mov r8, r0
	movs r7, #0
	ldr r4, _08062138 @ =gUnknown_0816DB30
	ldr r5, [r4]
	ldr r0, [r5]
	ldr r1, _0806213C @ =0x00003262
	adds r0, r0, r1
	movs r1, #0
	bl sub_080581A4
	ldr r0, [r5]
	ldr r2, _08062140 @ =0x00002852
	adds r0, r0, r2
	bl sub_0801F92C
	bl sub_08062330
	mov r3, sp
	adds r3, #8
	str r3, [sp, #0x1c]
	b _080622A2
	.align 2, 0
_08062138: .4byte gUnknown_0816DB30
_0806213C: .4byte 0x00003262
_08062140: .4byte 0x00002852
_08062144:
	ldr r2, _08062304 @ =gUnknown_030013EC
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	movs r5, #0
	str r5, [sp]
	ldr r4, [r2]
	ldr r2, [sp, #0x10]
	movs r3, #0x78
	bl _call_via_r4
	ldr r3, _08062308 @ =gUnknown_02029ED8
	mov r0, sl
	adds r2, r7, r0
	ldr r0, _0806230C @ =gUnknown_030033EC
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0xa
	adds r2, r2, r0
	adds r2, r2, r3
	ldrb r2, [r2]
	mov r8, r2
	movs r6, #0
	ldr r1, _08062310 @ =gUnknown_08499590
	ldr r0, [r1]
	adds r2, r7, #1
	str r2, [sp, #0x18]
	ldrh r0, [r0, #2]
	cmp r5, r0
	bge _08062264
_08062180:
	movs r4, #0
	ldr r3, _08062310 @ =gUnknown_08499590
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r4, r0
	bge _08062258
	ldr r1, _08062314 @ =gUnknown_03003340
	ldr r5, _0806230C @ =gUnknown_030033EC
	mov sb, r5
	lsls r0, r6, #2
	adds r0, r0, r1
	str r0, [sp, #0x14]
_08062198:
	ldr r1, [sp, #0x14]
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0806224C
	ldr r2, _08062310 @ =gUnknown_08499590
	mov ip, r2
	ldr r2, [r2]
	lsls r5, r6, #1
	ldr r7, _08062318 @ =0x0000417A
	adds r0, r2, r7
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r3, r0, r4
	ldr r1, _0806231C @ =0x00001432
	adds r0, r2, r1
	adds r0, r0, r3
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	ldr r1, _08062320 @ =gUnknown_085767D5
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806224C
	ldr r1, _08062324 @ =0x00003262
	adds r0, r2, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806224C
	mov r2, r8
	lsls r3, r2, #3
	mov r1, sl
	ldr r2, [sp, #0xc]
	subs r0, r1, r2
	lsls r0, r0, #5
	adds r3, r3, r0
	mov r0, sb
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0xa
	adds r0, r3, r0
	ldr r1, _08062308 @ =gUnknown_02029ED8
	adds r0, r0, r1
	adds r0, #0x60
	strb r4, [r0]
	mov r2, sb
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0xa
	adds r0, r3, r0
	ldr r1, _08062308 @ =gUnknown_02029ED8
	adds r0, r0, r1
	adds r0, #0x61
	strb r6, [r0]
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0xa
	adds r3, r3, r0
	ldr r2, _08062328 @ =gUnknown_02029F3C
	adds r3, r3, r2
	mov r0, ip
	ldr r1, [r0]
	adds r2, r1, r7
	adds r2, r2, r5
	ldrh r0, [r2]
	adds r0, r0, r4
	ldr r5, _0806232C @ =0x0000193A
	adds r0, r0, r5
	adds r0, r1, r0
	str r0, [r3]
	ldrh r0, [r2]
	adds r0, r0, r4
	ldr r2, _08062324 @ =0x00003262
	adds r1, r1, r2
	adds r1, r1, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r3, #1
	add r8, r3
	mov r5, r8
	cmp r5, #0x7a
	bgt _08062264
_0806224C:
	adds r4, #1
	ldr r1, _08062310 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0]
	cmp r4, r0
	blt _08062198
_08062258:
	adds r6, #1
	ldr r2, _08062310 @ =gUnknown_08499590
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r6, r0
	blt _08062180
_08062264:
	ldr r4, _08062308 @ =gUnknown_02029ED8
	mov r3, r8
	lsls r1, r3, #3
	mov r5, sl
	ldr r2, [sp, #0xc]
	subs r0, r5, r2
	lsls r0, r0, #5
	adds r1, r1, r0
	ldr r3, _0806230C @ =gUnknown_030033EC
	ldrh r2, [r3]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #0xa
	adds r1, r1, r0
	adds r1, r1, r4
	adds r1, #0x60
	movs r0, #0xfe
	strb r0, [r1]
	ldr r7, [sp, #0x18]
	cmp r7, #0x1e
	bgt _080622B8
	adds r2, r7, r5
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0xa
	adds r2, r2, r0
	adds r2, r2, r4
	mov r0, r8
	adds r0, #1
	strb r0, [r2]
_080622A2:
	add r0, sp, #4
	ldr r1, [sp, #0x1c]
	bl sub_080623C4
	lsls r0, r0, #0x18
	ldr r3, [sp, #0xc]
	lsls r3, r3, #5
	mov sl, r3
	cmp r0, #0
	beq _080622B8
	b _08062144
_080622B8:
	ldr r4, _08062308 @ =gUnknown_02029ED8
	mov r5, r8
	lsls r1, r5, #3
	mov r2, sl
	ldr r3, [sp, #0xc]
	subs r0, r2, r3
	lsls r0, r0, #5
	adds r1, r1, r0
	ldr r3, _0806230C @ =gUnknown_030033EC
	ldrh r2, [r3]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #0xa
	adds r1, r1, r0
	adds r1, r1, r4
	adds r1, #0x60
	movs r0, #0xff
	strb r0, [r1]
	mov r5, sl
	adds r1, r7, r5
	ldrh r2, [r3]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #0xa
	adds r1, r1, r0
	adds r1, r1, r4
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062304: .4byte gUnknown_030013EC
_08062308: .4byte gUnknown_02029ED8
_0806230C: .4byte gUnknown_030033EC
_08062310: .4byte gUnknown_08499590
_08062314: .4byte gUnknown_03003340
_08062318: .4byte 0x0000417A
_0806231C: .4byte 0x00001432
_08062320: .4byte gUnknown_085767D5
_08062324: .4byte 0x00003262
_08062328: .4byte gUnknown_02029F3C
_0806232C: .4byte 0x0000193A

