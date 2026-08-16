	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D620
sub_0806D620: @ 0x0806D620
	push {r4, r5, r6, r7, lr}
	ldr r4, _0806D680 @ =gUnknown_0816E198
	ldr r0, [r4]
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	mov ip, r4
	cmp r0, r1
	beq _0806D67A
	movs r3, #0
	ldr r1, _0806D684 @ =gUnknown_08580934
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	cmp r3, r0
	bge _0806D672
	adds r6, r1, #0
	movs r5, #0
	movs r4, #5
	rsbs r4, r4, #0
_0806D64C:
	ldr r2, [r6]
	lsls r1, r3, #2
	adds r0, r2, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	movs r7, #0x28
	ldrsh r0, [r1, r7]
	cmp r0, #0
	bge _0806D662
	adds r0, #0x1f
_0806D662:
	asrs r0, r0, #5
	strh r0, [r1, #0x24]
	str r4, [r1, #0x34]
	str r5, [r1, #0x30]
	adds r3, #1
	ldrb r2, [r2, #8]
	cmp r3, r2
	blt _0806D64C
_0806D672:
	mov r1, ip
	ldr r0, [r1]
	bl sub_0806377C
_0806D67A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D680: .4byte gUnknown_0816E198
_0806D684: .4byte gUnknown_08580934

