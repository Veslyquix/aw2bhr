	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A47C
sub_0808A47C: @ 0x0808A47C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r2, _0808A580 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	mov sb, r1
	mov r3, sb
	orrs r0, r3
	strb r0, [r2]
	ldr r0, _0808A584 @ =gUnknown_03002020
	movs r1, #8
	strh r1, [r0]
	ldr r0, _0808A588 @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r1, _0808A58C @ =gUnknown_03001FFC
	ldrh r0, [r1]
	strh r0, [r1]
	ldrh r1, [r2]
	ldr r0, _0808A590 @ =0x0000FFE0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	ldrb r1, [r2]
	movs r4, #0x21
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r2]
	ldr r0, _0808A594 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xa0
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldrb r1, [r2, #1]
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r2, #1]
	ldr r3, _0808A598 @ =gUnknown_03002B6C
	ldrb r2, [r3]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldr r3, _0808A59C @ =gUnknown_03001FE8
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	mov r8, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r3]
	ldr r2, _0808A5A0 @ =gUnknown_030030B4
	ldrb r0, [r2]
	ands r1, r0
	movs r5, #1
	orrs r1, r5
	strb r1, [r2]
	ldr r2, _0808A5A4 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	ldr r3, _0808A5A8 @ =gUnknown_030030DC
	ldrb r2, [r3]
	movs r0, #0x20
	orrs r2, r0
	ldrb r1, [r3, #1]
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r3, #1]
	ldr r6, _0808A5AC @ =gUnknown_030030A4
	ldrb r0, [r6, #1]
	orrs r0, r5
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r6, #1]
	orrs r2, r5
	mov r0, r8
	orrs r2, r0
	movs r0, #4
	orrs r2, r0
	movs r0, #8
	orrs r2, r0
	movs r0, #0x10
	orrs r2, r0
	strb r2, [r3]
	ldr r1, _0808A5B0 @ =gUnknown_03002B68
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0808A5B4 @ =gUnknown_03002B30
	movs r0, #0x90
	strb r0, [r1]
	ldr r1, _0808A5B8 @ =gUnknown_030024E4
	movs r0, #0xf0
	strb r0, [r1]
	ldr r1, _0808A5BC @ =gUnknown_030020B8
	movs r0, #0xa0
	strb r0, [r1]
	ldr r1, _0808A5C0 @ =gUnknown_030030CC
	ldrb r0, [r1, #1]
	ands r4, r0
	mov r2, sb
	orrs r4, r2
	movs r0, #0x7f
	ands r4, r0
	strb r4, [r1, #1]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A580: .4byte gUnknown_030030E0
_0808A584: .4byte gUnknown_03002020
_0808A588: .4byte gUnknown_03002B28
_0808A58C: .4byte gUnknown_03001FFC
_0808A590: .4byte 0x0000FFE0
_0808A594: .4byte 0x0000E0FF
_0808A598: .4byte gUnknown_03002B6C
_0808A59C: .4byte gUnknown_03001FE8
_0808A5A0: .4byte gUnknown_030030B4
_0808A5A4: .4byte gUnknown_0300251C
_0808A5A8: .4byte gUnknown_030030DC
_0808A5AC: .4byte gUnknown_030030A4
_0808A5B0: .4byte gUnknown_03002B68
_0808A5B4: .4byte gUnknown_03002B30
_0808A5B8: .4byte gUnknown_030024E4
_0808A5BC: .4byte gUnknown_030020B8
_0808A5C0: .4byte gUnknown_030030CC

