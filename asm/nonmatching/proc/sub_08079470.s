	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08079470
sub_08079470: @ 0x08079470
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r0, _080794DC @ =gUnknown_081D92E8
	mov r8, r0
	movs r6, #0xa0
	lsls r6, r6, #1
	movs r5, #8
	rsbs r5, r5, #0
	movs r4, #3
_0807948A:
	ldr r1, _080794E0 @ =0x000001FF
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #7
	orrs r0, r6
	str r0, [sp]
	movs r0, #0
	movs r2, #0x30
	mov r7, r8
	ldr r3, [r7]
	bl PutSprite
	adds r6, #0x40
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0807948A
	mov r1, sb
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x21
	ble _080794CE
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080794E4 @ =0x000001D7
	bl sub_0803B4DC
	mov r0, sb
	bl Proc_Break
_080794CE:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080794DC: .4byte gUnknown_081D92E8
_080794E0: .4byte 0x000001FF
_080794E4: .4byte 0x000001D7

