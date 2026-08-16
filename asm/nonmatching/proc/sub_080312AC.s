	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080312AC
sub_080312AC: @ 0x080312AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	movs r0, #0
	mov sl, r0
	ldr r0, _080313EC @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x3f
	ands r0, r1
	lsls r6, r0, #0x10
	lsrs r1, r6, #0x10
	ldr r0, _080313F0 @ =gUnknown_0849B060
	ldr r0, [r0]
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #3
	bne _080312D8
	b _080313DC
_080312D8:
	movs r5, #0
	ldr r4, _080313F4 @ =gUnknown_0849B0C4
	adds r0, r1, #0
	movs r1, #0x1e
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, r0, r4
	str r0, [sp, #4]
	movs r0, #0xc7
	lsls r0, r0, #2
	mov r8, r0
	movs r7, #0x58
	movs r4, #0x50
	lsrs r6, r6, #0x11
_080312F8:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	bl sub_0802F460
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08031376
	lsls r2, r5, #2
	ldr r1, _080313F8 @ =0x000001FF
	ands r1, r4
	ldr r0, _080313FC @ =gUnknown_0849B258
	adds r2, r2, r0
	ldr r3, [r2]
	adds r0, r5, #0
	adds r0, #8
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl PutSpriteExt
	movs r1, #1
	add sl, r1
	ldr r0, _08031400 @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	bne _08031368
	ldr r1, _08031404 @ =gUnknown_0849B27C
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r2, [sp, #4]
	ldrb r1, [r2]
	movs r2, #0x58
	subs r2, r2, r1
	movs r1, #0
	str r1, [sp]
	adds r1, r7, #0
	movs r3, #0
	bl sub_0801F34C
	ldr r2, _08031408 @ =gPal
	add r2, r8
	movs r1, #0xf
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _0803140C @ =gUnknown_081D3E68
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bl sub_080135A4
_08031368:
	movs r2, #0x20
	add r8, r2
	adds r7, #0x28
	adds r4, #0x28
	adds r5, #1
	cmp r5, #3
	ble _080312F8
_08031376:
	mov r0, sl
	cmp r0, #0
	beq _08031394
	ldr r1, _08031410 @ =gUnknown_0849B268
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
	movs r2, #0x38
	bl PutSpriteExt
_08031394:
	ldr r0, _08031400 @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _080313DC
	mov r1, sb
	ldr r0, [r1, #0x58]
	cmp r0, #0
	bne _080313C6
	bl sub_0802F4A0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080313BE
	movs r0, #1
	mov r2, sb
	str r0, [r2, #0x58]
	ldr r0, _08031414 @ =gUnknown_0849B1A0
	mov r1, sb
	bl Proc_Start
_080313BE:
	mov r1, sb
	ldr r0, [r1, #0x58]
	cmp r0, #0
	beq _080313DC
_080313C6:
	bl sub_0802F4A0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080313DC
	mov r2, sb
	str r0, [r2, #0x58]
	ldr r0, _08031414 @ =gUnknown_0849B1A0
	bl Proc_EndEach
_080313DC:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080313EC: .4byte gUnknown_03004008
_080313F0: .4byte gUnknown_0849B060
_080313F4: .4byte gUnknown_0849B0C4
_080313F8: .4byte 0x000001FF
_080313FC: .4byte gUnknown_0849B258
_08031400: .4byte gUnknown_0849B018
_08031404: .4byte gUnknown_0849B27C
_08031408: .4byte gPal
_0803140C: .4byte gUnknown_081D3E68
_08031410: .4byte gUnknown_0849B268
_08031414: .4byte gUnknown_0849B1A0

