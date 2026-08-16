	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08023518
sub_08023518: @ 0x08023518
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _08023608 @ =gUnknown_080909F0
	ldr r7, [r2]
	ldr r6, [r7]
	ldrh r1, [r6, #0x10]
	movs r0, #0xf
	ands r0, r1
	mov sb, r2
	cmp r0, #0
	bne _080235FA
	ldr r0, _0802360C @ =gpKeySt
	ldr r0, [r0]
	ldrh r0, [r0]
	lsrs r4, r0, #4
	movs r0, #0xf
	ands r4, r0
	ldr r1, _08023610 @ =gUnknown_080909F4
	ldr r0, [r1]
	mov ip, r0
	lsls r3, r4, #2
	adds r2, r3, r0
	movs r5, #0
	ldrsh r0, [r2, r5]
	mov r8, r1
	ldr r5, _08023614 @ =gUnknown_080909F8
	cmp r0, #0
	bge _08023560
	ldr r1, [r5]
	ldrh r0, [r6, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	adds r0, #2
	strh r0, [r1]
_08023560:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _08023576
	ldr r1, [r5]
	ldr r0, [r7]
	ldrh r0, [r0, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	adds r0, #0xc
	strh r0, [r1]
_08023576:
	mov r0, ip
	adds r0, #2
	adds r3, r3, r0
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _08023592
	ldr r1, [r5]
	ldr r0, [r7]
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	adds r0, #2
	strh r0, [r1, #2]
_08023592:
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	ble _080235A8
	ldr r1, [r5]
	ldr r0, [r7]
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	adds r0, #7
	strh r0, [r1, #2]
_080235A8:
	ldr r6, [r5]
	ldrh r0, [r6]
	movs r1, #0
	ldrsh r2, [r2, r1]
	adds r3, r0, r2
	cmp r3, #0
	blt _080235CA
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r3, r0
	bge _080235CA
	ldr r1, _08023618 @ =gUnknown_030032C4
	lsls r0, r2, #2
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	strh r3, [r6]
_080235CA:
	ldr r5, [r5]
	ldrh r0, [r5, #2]
	mov r2, r8
	ldr r1, [r2]
	lsls r2, r4, #2
	adds r1, #2
	adds r2, r2, r1
	movs r1, #0
	ldrsh r2, [r2, r1]
	adds r3, r0, r2
	cmp r3, #0
	blt _080235FA
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r3, r0
	bge _080235FA
	ldr r1, _08023618 @ =gUnknown_030032C4
	lsls r0, r2, #2
	ldrh r2, [r1, #2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	strh r3, [r5, #2]
_080235FA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023608: .4byte gUnknown_080909F0
_0802360C: .4byte gpKeySt
_08023610: .4byte gUnknown_080909F4
_08023614: .4byte gUnknown_080909F8
_08023618: .4byte gUnknown_030032C4

