	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D34C
sub_0806D34C: @ 0x0806D34C
	push {r4, r5, r6, r7, lr}
	ldr r4, _0806D3A4 @ =gUnknown_0816E194
	ldr r0, [r4]
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	mov ip, r4
	cmp r0, r1
	beq _0806D39C
	movs r3, #0
	ldr r7, _0806D3A8 @ =gUnknown_08580934
	movs r6, #0
	movs r5, #6
	movs r4, #5
_0806D36E:
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
	subs r0, r5, r3
	strh r0, [r2, #0x24]
	str r4, [r2, #0x34]
	str r6, [r2, #0x30]
	adds r3, #1
	cmp r3, #6
	ble _0806D36E
	mov r1, ip
	ldr r0, [r1]
	bl sub_0806377C
_0806D39C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D3A4: .4byte gUnknown_0816E194
_0806D3A8: .4byte gUnknown_08580934

