	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018254
sub_08018254: @ 0x08018254
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	ldr r5, _08018364 @ =gUnknown_03001FC8
	movs r6, #0
	strh r6, [r5]
	ldr r1, _08018368 @ =gUnknown_030024E0
	mov r8, r1
	strh r6, [r1]
	ldr r1, _0801836C @ =gUnknown_03002B6C
	ldr r2, [r1]
	movs r1, #0xc
	ands r2, r1
	ldrb r4, [r5]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r1, r4
	orrs r1, r2
	strb r1, [r5]
	ldrb r2, [r5, #1]
	movs r4, #0x20
	rsbs r4, r4, #0
	adds r1, r4, #0
	ands r1, r2
	movs r2, #0xd
	orrs r1, r2
	strb r1, [r5, #1]
	ldr r1, _08018370 @ =gUnknown_030030B4
	ldr r2, [r1]
	movs r1, #0xc
	ands r2, r1
	mov r5, r8
	ldrb r1, [r5]
	ands r3, r1
	orrs r3, r2
	strb r3, [r5]
	ldrb r1, [r5, #1]
	ands r4, r1
	movs r1, #0x1c
	orrs r4, r1
	strb r4, [r5, #1]
	ldr r4, _08018374 @ =gUnknown_03002004
	strh r6, [r4]
	ldrb r1, [r4]
	movs r3, #8
	rsbs r3, r3, #0
	ands r3, r1
	movs r1, #0x40
	orrs r3, r1
	ldrb r1, [r4, #1]
	movs r2, #1
	orrs r1, r2
	movs r2, #2
	orrs r1, r2
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	subs r2, #4
	ands r1, r2
	strb r1, [r4, #1]
	movs r1, #0x20
	orrs r3, r1
	strb r3, [r4]
	ldr r1, _08018378 @ =gUnknown_03002B48
	strh r6, [r1]
	ldr r1, _0801837C @ =gUnknown_03001FC0
	strh r6, [r1]
	ldr r1, _08018380 @ =gUnknown_030030D8
	strh r6, [r1]
	ldr r1, _08018384 @ =gUnknown_0300303C
	strh r6, [r1]
	ldr r6, _08018388 @ =gUnknown_0808E56C
	mov r8, r6
	ldr r3, [r6]
	ldr r4, _0801838C @ =gUnknown_0808E570
	ldr r2, [r4]
	lsrs r1, r0, #0x10
	mov sl, r1
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r0, [r1, #0xc]
	strh r0, [r3]
	ldrh r0, [r1, #8]
	adds r3, r0, #0
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	ldr r7, _08018390 @ =0x00007FFF
	ands r7, r2
	ldrh r6, [r1, #0xa]
	movs r5, #0xa
	ldrsh r0, [r1, r5]
	mov sb, r4
	cmp r0, #0
	bne _08018326
	movs r6, #1
_08018326:
	lsls r0, r6, #0x10
	ldr r6, _08018394 @ =0xFFFF0000
	adds r0, r0, r6
	lsrs r6, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	ldr r5, _08018398 @ =gUnknown_0808E574
	cmp r2, r0
	beq _080183A4
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	beq _080183A0
	ldr r3, [r5]
	ldr r0, _0801839C @ =gUnknown_08499598
	ldr r0, [r0]
	lsls r2, r7, #4
	subs r2, r2, r7
	lsls r2, r2, #2
	adds r2, r2, r0
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldrb r2, [r2, #0x1d]
	adds r0, r0, r2
	strh r0, [r3, #2]
	b _080183A4
	.align 2, 0
_08018364: .4byte gUnknown_03001FC8
_08018368: .4byte gUnknown_030024E0
_0801836C: .4byte gUnknown_03002B6C
_08018370: .4byte gUnknown_030030B4
_08018374: .4byte gUnknown_03002004
_08018378: .4byte gUnknown_03002B48
_0801837C: .4byte gUnknown_03001FC0
_08018380: .4byte gUnknown_030030D8
_08018384: .4byte gUnknown_0300303C
_08018388: .4byte gUnknown_0808E56C
_0801838C: .4byte gUnknown_0808E570
_08018390: .4byte 0x00007FFF
_08018394: .4byte 0xFFFF0000
_08018398: .4byte gUnknown_0808E574
_0801839C: .4byte gUnknown_08499598
_080183A0:
	ldr r0, [r5]
	strh r3, [r0, #2]
_080183A4:
	ldr r1, _080183C8 @ =gUnknown_0848A370
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_08012A54
	ldr r0, _080183CC @ =gUnknown_03002F20
	ldr r0, [r0]
	cmp r0, #0
	beq _080183D4
	bl _call_via_r0
	ldr r4, _080183D0 @ =gUnknown_0808E578
	b _080183F8
	.align 2, 0
_080183C8: .4byte gUnknown_0848A370
_080183CC: .4byte gUnknown_03002F20
_080183D0: .4byte gUnknown_0808E578
_080183D4:
	ldr r4, _0801844C @ =gUnknown_0808E578
	ldr r0, [r4]
	ldr r0, [r0]
	ldr r3, _08018450 @ =gUnknown_080D445C
	ldr r1, [r5]
	ldrb r1, [r1]
	lsls r1, r1, #0xc
	movs r6, #0xd8
	lsls r6, r6, #2
	adds r2, r6, #0
	orrs r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	bl sub_08071948
_080183F8:
	ldr r0, [r4]
	ldr r0, [r0]
	ldr r1, _08018454 @ =0x0600E000
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_08011E54
	bl sub_080179AC
	ldr r0, [r5]
	ldrb r0, [r0, #2]
	bl sub_08018194
	mov r0, sb
	ldr r5, [r0]
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r0, r4, r5
	movs r1, #0x2f
	strh r1, [r0, #0xe]
	ldr r0, _08018458 @ =gUnknown_03001420
	strh r1, [r0]
	ldr r0, _0801845C @ =sub_08017EEC
	bl sub_08011AAC
	adds r5, #8
	adds r4, r4, r5
	ldr r0, _08018460 @ =sub_0801820C
	str r0, [r4]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801844C: .4byte gUnknown_0808E578
_08018450: .4byte gUnknown_080D445C
_08018454: .4byte 0x0600E000
_08018458: .4byte gUnknown_03001420
_0801845C: .4byte sub_08017EEC
_08018460: .4byte sub_0801820C

