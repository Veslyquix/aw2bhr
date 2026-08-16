	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F908
sub_0803F908: @ 0x0803F908
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	mov ip, r2
	ldr r0, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r3, #0
	bge _0803F928
	movs r3, #0xc0
	lsls r3, r3, #8
	ldr r6, _0803F924 @ =gUnknown_08091308
	b _0803F956
	.align 2, 0
_0803F924: .4byte gUnknown_08091308
_0803F928:
	adds r0, r3, #0
	adds r0, #8
	lsls r0, r0, #0x1c
	lsrs r3, r0, #0x10
	ldr r6, _0803F984 @ =gUnknown_08091308
	cmp r1, #0
	beq _0803F956
	ldr r0, [r6]
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r7, _0803F988 @ =0x0000417A
	adds r0, r1, r7
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _0803F98C @ =0x0000234A
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0803F956
	movs r3, #0xd0
	lsls r3, r3, #8
_0803F956:
	lsls r1, r4, #4
	ldr r0, [r6]
	ldr r2, [r0]
	movs r4, #4
	ldrsh r0, [r2, r4]
	subs r4, r1, r0
	lsls r1, r5, #4
	movs r5, #6
	ldrsh r0, [r2, r5]
	subs r5, r1, r0
	adds r0, r3, #0
	adds r0, #0x48
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, ip
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F984: .4byte gUnknown_08091308
_0803F988: .4byte 0x0000417A
_0803F98C: .4byte 0x0000234A

