	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064B68
sub_08064B68: @ 0x08064B68
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, _08064BC0 @ =gUnknown_0816E0F4
	ldr r0, [r4]
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	mov ip, r4
	cmp r0, r1
	beq _08064BB8
	movs r3, #0
	ldr r7, _08064BC4 @ =gUnknown_08580934
	movs r6, #0
	movs r4, #6
_08064B8A:
	ldr r1, [r7]
	lsls r2, r3, #2
	adds r0, r1, #0
	adds r0, #0x54
	adds r0, r0, r2
	ldr r2, [r0]
	adds r1, #0x84
	adds r1, r1, r3
	adds r0, r2, #0
	adds r0, #0x48
	ldrb r0, [r0]
	strb r0, [r1]
	subs r0, r4, r3
	strh r0, [r2, #0x24]
	strh r5, [r2, #0x3c]
	strh r6, [r2, #0x3a]
	adds r3, #1
	cmp r3, #6
	ble _08064B8A
	mov r1, ip
	ldr r0, [r1]
	bl sub_0806377C
_08064BB8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064BC0: .4byte gUnknown_0816E0F4
_08064BC4: .4byte gUnknown_08580934

