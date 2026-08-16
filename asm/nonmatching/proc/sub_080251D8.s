	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080251D8
sub_080251D8: @ 0x080251D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r1, r0, #0
	movs r6, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	ldr r2, _08025230 @ =gUnknown_08499594
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, [r2]
	adds r5, r2, r0
	ldr r4, _08025234 @ =gUnknown_08090A44
	ldr r0, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_08024A2C
	ldrh r1, [r5, #4]
	movs r0, #0xf0
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08025240
	ldr r0, _08025238 @ =gUnknown_030033EC
	ldrh r2, [r0]
	ldr r0, _0802523C @ =gUnknown_08499598
	ldr r0, [r0]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	ldrb r2, [r5]
	str r6, [sp]
	movs r3, #3
	bl sub_08043070
	adds r6, r0, #0
	b _08025272
	.align 2, 0
_08025230: .4byte gUnknown_08499594
_08025234: .4byte gUnknown_08090A44
_08025238: .4byte gUnknown_030033EC
_0802523C: .4byte gUnknown_08499598
_08025240:
	ldrb r0, [r5]
	movs r1, #3
	movs r2, #1
	bl sub_080433F8
	mov r8, r0
	cmp r0, #0
	beq _08025272
	ldr r0, _08025288 @ =gUnknown_030033EC
	ldrh r2, [r0]
	ldr r0, _0802528C @ =gUnknown_08499598
	ldr r0, [r0]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	ldrb r2, [r5]
	movs r3, #1
	str r3, [sp]
	movs r3, #3
	bl sub_08043070
	adds r7, r0, #0
_08025272:
	cmp r6, r7
	bgt _08025290
	mov r2, r8
	cmp r2, #0
	beq _0802529E
	ldr r1, [r4]
	movs r0, #5
	strh r0, [r1, #0x18]
	strh r7, [r1, #0x10]
	b _0802529E
	.align 2, 0
_08025288: .4byte gUnknown_030033EC
_0802528C: .4byte gUnknown_08499598
_08025290:
	ldr r1, [r4]
	movs r0, #1
	strh r0, [r1, #0x18]
	strh r6, [r1, #0x10]
	ldrh r0, [r1, #0xa]
	subs r0, #1
	strh r0, [r1, #0xa]
_0802529E:
	ldr r5, [r4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl sub_08024C58
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _080252CC
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	movs r2, #0x14
	ldrsh r1, [r5, r2]
	adds r0, #1
	muls r0, r1, r0
	b _080252CE
_080252CC:
	movs r0, #0
_080252CE:
	movs r1, #0xa
	bl Div
	ldr r1, [r4]
	strh r0, [r1, #0xc]
	strh r0, [r1, #0x14]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

