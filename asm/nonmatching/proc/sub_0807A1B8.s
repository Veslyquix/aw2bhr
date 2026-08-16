	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807A1B8
sub_0807A1B8: @ 0x0807A1B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	ldr r7, _0807A250 @ =gUnknown_081D92F8
	movs r6, #0xa0
	lsls r6, r6, #1
	movs r5, #8
	rsbs r5, r5, #0
	movs r4, #3
_0807A1CE:
	ldr r1, _0807A254 @ =0x000001FF
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #7
	orrs r0, r6
	str r0, [sp]
	movs r0, #0
	movs r2, #0x30
	ldr r3, [r7]
	bl PutSprite
	adds r6, #0x40
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0807A1CE
	mov r2, r8
	adds r2, #0x4c
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x30
	ble _0807A204
	movs r0, #0x30
	strh r0, [r2]
_0807A204:
	ldr r0, _0807A258 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0807A244
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x30
	bne _0807A244
	movs r0, #0
	strh r0, [r2]
	ldr r1, _0807A25C @ =gUnknown_03001400
	ldr r2, _0807A260 @ =0x0000FF10
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0807A264 @ =gDispIo
	ldrb r1, [r2, #1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	movs r1, #0xe
	movs r2, #0x1e
	movs r3, #6
	bl sub_0801A444
	mov r0, r8
	bl Proc_Break
_0807A244:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A250: .4byte gUnknown_081D92F8
_0807A254: .4byte 0x000001FF
_0807A258: .4byte gpKeySt
_0807A25C: .4byte gUnknown_03001400
_0807A260: .4byte 0x0000FF10
_0807A264: .4byte gDispIo

