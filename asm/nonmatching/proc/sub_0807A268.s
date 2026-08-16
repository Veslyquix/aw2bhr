	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807A268
sub_0807A268: @ 0x0807A268
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x30
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0xf0
	bl Interpolate
	str r0, [r6, #0x34]
	ldr r2, _0807A35C @ =gUnknown_081D9300
	mov r8, r2
	cmp r0, #0x70
	bgt _0807A2D2
	ldr r3, _0807A360 @ =gUnknown_081D92FC
	mov sb, r3
	movs r7, #0xa0
	lsls r7, r7, #1
	mov sl, r7
	movs r5, #8
	rsbs r5, r5, #0
	movs r4, #3
_0807A2A4:
	ldr r1, _0807A364 @ =0x000001FF
	ands r1, r5
	ldr r0, [r6, #0x34]
	movs r2, #0x30
	subs r2, r2, r0
	movs r0, #0xff
	ands r2, r0
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
	bge _0807A2A4
_0807A2D2:
	mov r2, r8
	ldr r1, [r2]
	ldr r0, [r6, #0x34]
	subs r0, #0xf0
	strh r0, [r1]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x30
	rsbs r1, r1, #0
	cmp r0, r1
	ble _0807A2F4
	ldr r0, _0807A368 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0, #1]
_0807A2F4:
	adds r0, r6, #0
	adds r0, #0x4c
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r4, r0, #0
	cmp r1, #0x1b
	ble _0807A334
	cmp r1, #0x2e
	bgt _0807A31E
	movs r1, #0x40
	rsbs r1, r1, #0
	movs r7, #0
	ldrsh r3, [r4, r7]
	subs r3, #0x1e
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r2, #0x40
	bl Interpolate
	str r0, [r6, #0x3c]
_0807A31E:
	ldr r0, [r6, #0x3c]
	ldr r1, _0807A364 @ =0x000001FF
	ands r0, r1
	movs r2, #0xb0
	lsls r2, r2, #8
	movs r1, #0
	str r1, [sp]
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043C28
_0807A334:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x2f
	ble _0807A346
	bl sub_0807A860
	adds r0, r6, #0
	bl Proc_Break
_0807A346:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A35C: .4byte gUnknown_081D9300
_0807A360: .4byte gUnknown_081D92FC
_0807A364: .4byte 0x000001FF
_0807A368: .4byte gDispIo

