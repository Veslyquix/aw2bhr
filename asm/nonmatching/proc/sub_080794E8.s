	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080794E8
sub_080794E8: @ 0x080794E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x13
	ble _0807950E
	adds r0, r6, #0
	movs r1, #0
	bl sub_080795A8
	mov r8, r4
	b _0807956E
_0807950E:
	movs r7, #0
	ldrsh r3, [r4, r7]
	movs r0, #0x14
	str r0, [sp]
	movs r0, #4
	movs r1, #0x30
	movs r2, #0x14
	bl Interpolate
	str r0, [r6, #0x34]
	mov r8, r4
	ldr r0, _08079598 @ =gUnknown_081D92EC
	mov sb, r0
	movs r1, #0xa0
	lsls r1, r1, #1
	mov sl, r1
	movs r5, #8
	rsbs r5, r5, #0
	movs r4, #3
_08079534:
	ldr r1, _0807959C @ =0x000001FF
	ands r1, r5
	ldr r2, [r6, #0x34]
	movs r0, #0x80
	lsls r0, r0, #7
	mov r3, sl
	orrs r0, r3
	str r0, [sp]
	movs r0, #0
	mov r7, sb
	ldr r3, [r7]
	bl PutSprite
	movs r0, #0x40
	add sl, r0
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bge _08079534
	ldr r0, [r6, #0x34]
	movs r2, #0x20
	subs r2, r2, r0
	ldr r3, _080795A0 @ =gUnknown_08615BE4
	ldr r0, _080795A4 @ =0x000052D8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x32
	bl PutSprite
_0807956E:
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2f
	ble _08079588
	movs r0, #0
	strh r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08079588:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079598: .4byte gUnknown_081D92EC
_0807959C: .4byte 0x000001FF
_080795A0: .4byte gUnknown_08615BE4
_080795A4: .4byte 0x000052D8

