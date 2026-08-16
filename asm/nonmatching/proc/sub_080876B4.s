	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080876B4
sub_080876B4: @ 0x080876B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _08087760 @ =gUnknown_030030CC
	ldrb r0, [r1, #1]
	movs r2, #1
	mov sb, r2
	mov r4, sb
	orrs r4, r0
	movs r0, #2
	mov r8, r0
	mov r1, r8
	orrs r4, r1
	movs r2, #4
	mov ip, r2
	mov r0, ip
	orrs r4, r0
	movs r7, #8
	orrs r4, r7
	movs r6, #0x10
	orrs r4, r6
	ldr r1, _08087760 @ =gUnknown_030030CC
	strb r4, [r1, #1]
	ldr r5, _08087764 @ =gUnknown_030030A4
	ldrb r1, [r5, #1]
	mov r2, sb
	orrs r1, r2
	mov r0, r8
	orrs r1, r0
	mov r2, ip
	orrs r1, r2
	orrs r1, r7
	orrs r1, r6
	ldr r3, _08087768 @ =gUnknown_030030DC
	ldrb r2, [r3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	mov r2, r8
	orrs r0, r2
	mov r2, ip
	orrs r0, r2
	orrs r0, r7
	orrs r0, r6
	strb r0, [r3]
	ldrb r0, [r5]
	movs r2, #0x20
	mov sl, r2
	mov r2, sl
	orrs r2, r0
	strb r2, [r5]
	mov r0, sl
	orrs r1, r0
	strb r1, [r5, #1]
	ldr r0, _0808776C @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _08087784
	ldr r1, _08087770 @ =gUnknown_03002B68
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08087774 @ =gUnknown_03002B30
	movs r0, #0x28
	strb r0, [r1]
	ldr r1, _08087778 @ =gUnknown_030024E4
	movs r0, #0x58
	strb r0, [r1]
	ldr r1, _0808777C @ =gUnknown_030020B8
	ldr r0, _08087780 @ =gUnknown_03005928
	ldr r0, [r0]
	lsls r0, r0, #4
	adds r0, #0x28
	strb r0, [r1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r4, r0
	movs r0, #0x40
	orrs r4, r0
	movs r0, #0x7f
	ands r4, r0
	ldr r1, _08087760 @ =gUnknown_030030CC
	strb r4, [r1, #1]
	b _08087820
	.align 2, 0
_08087760: .4byte gUnknown_030030CC
_08087764: .4byte gUnknown_030030A4
_08087768: .4byte gUnknown_030030DC
_0808776C: .4byte gUnknown_03003FC0
_08087770: .4byte gUnknown_03002B68
_08087774: .4byte gUnknown_03002B30
_08087778: .4byte gUnknown_030024E4
_0808777C: .4byte gUnknown_030020B8
_08087780: .4byte gUnknown_03005928
_08087784:
	ldr r0, _080877B8 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	movs r3, #0xcc
	lsls r3, r3, #2
	ands r3, r0
	cmp r3, #0
	beq _080877D0
	ldr r0, _080877BC @ =gUnknown_03002B68
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080877C0 @ =gUnknown_03002B30
	strb r1, [r0]
	ldr r1, _080877C4 @ =gUnknown_030024E4
	movs r0, #0x48
	strb r0, [r1]
	ldr r1, _080877C8 @ =gUnknown_030020B8
	ldr r0, _080877CC @ =gUnknown_03005928
	ldr r0, [r0]
	lsls r0, r0, #4
	adds r0, #0x48
	strb r0, [r1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r4, r0
	b _08087814
	.align 2, 0
_080877B8: .4byte gUnknown_03002EE0
_080877BC: .4byte gUnknown_03002B68
_080877C0: .4byte gUnknown_03002B30
_080877C4: .4byte gUnknown_030024E4
_080877C8: .4byte gUnknown_030020B8
_080877CC: .4byte gUnknown_03005928
_080877D0:
	mov r0, sb
	orrs r2, r0
	mov r1, r8
	orrs r2, r1
	mov r0, ip
	orrs r2, r0
	orrs r2, r7
	orrs r2, r6
	strb r2, [r5]
	ldr r0, _08087830 @ =gUnknown_03002B40
	strb r3, [r0]
	ldr r1, _08087834 @ =gUnknown_03002EFC
	movs r0, #0x28
	strb r0, [r1]
	ldr r0, _08087838 @ =gUnknown_03002B4C
	movs r2, #0x48
	strb r2, [r0]
	ldr r1, _0808783C @ =gUnknown_03002B44
	movs r0, #0x38
	strb r0, [r1]
	ldr r0, _08087840 @ =gUnknown_03002B68
	strb r3, [r0]
	ldr r0, _08087844 @ =gUnknown_03002B30
	strb r2, [r0]
	ldr r0, _08087848 @ =gUnknown_030024E4
	strb r2, [r0]
	ldr r1, _0808784C @ =gUnknown_030020B8
	ldr r0, _08087850 @ =gUnknown_03005928
	ldr r0, [r0]
	lsls r0, r0, #4
	adds r0, #0x48
	strb r0, [r1]
	mov r1, sl
	orrs r4, r1
_08087814:
	movs r0, #0x40
	orrs r4, r0
	movs r0, #0x7f
	ands r4, r0
	ldr r2, _08087854 @ =gUnknown_030030CC
	strb r4, [r2, #1]
_08087820:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087830: .4byte gUnknown_03002B40
_08087834: .4byte gUnknown_03002EFC
_08087838: .4byte gUnknown_03002B4C
_0808783C: .4byte gUnknown_03002B44
_08087840: .4byte gUnknown_03002B68
_08087844: .4byte gUnknown_03002B30
_08087848: .4byte gUnknown_030024E4
_0808784C: .4byte gUnknown_030020B8
_08087850: .4byte gUnknown_03005928
_08087854: .4byte gUnknown_030030CC

