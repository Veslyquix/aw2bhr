	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D268
sub_0806D268: @ 0x0806D268
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r6, #7
	movs r5, #0x54
	movs r4, #0
	ldr r0, _0806D330 @ =gUnknown_0816E18C
	mov sl, r0
	ldr r1, _0806D334 @ =gUnknown_0816E190
	mov sb, r1
	ldr r0, _0806D338 @ =gUnknown_08580934
	mov r8, r0
	movs r1, #0xc0
	lsls r1, r1, #7
	adds r7, r1, #0
_0806D28A:
	ldr r0, _0806D33C @ =gUnknown_08581E94
	movs r1, #3
	bl sub_080152EC
	mov ip, r0
	mov r1, r8
	ldr r0, [r1]
	lsls r3, r4, #2
	adds r0, #0x54
	adds r0, r0, r3
	mov r1, ip
	str r1, [r0]
	adds r1, #0x46
	movs r0, #0
	strb r0, [r1]
	mov r0, ip
	str r6, [r0, #0x2c]
	strh r5, [r0, #0x2a]
	adds r6, #0x20
	subs r5, #8
	movs r0, #6
	subs r0, r0, r4
	mov r1, ip
	strh r0, [r1, #0x24]
	ldr r0, _0806D340 @ =gUnknown_0816E0D0
	lsls r2, r4, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	adds r0, r7, r0
	strh r0, [r1, #0x3e]
	ldr r0, _0806D344 @ =gUnknown_0816E0DE
	adds r0, r2, r0
	ldrh r0, [r0]
	adds r1, r7, r0
	mov r0, ip
	adds r0, #0x40
	strh r1, [r0]
	ldr r0, _0806D348 @ =gUnknown_085809A4
	adds r2, r2, r0
	ldrh r0, [r2]
	mov r1, ip
	adds r1, #0x4b
	strb r0, [r1]
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0x84
	adds r0, r0, r4
	ldrb r1, [r0]
	mov r0, ip
	adds r0, #0x48
	strb r1, [r0]
	mov r1, sl
	ldr r0, [r1]
	adds r3, r3, r0
	ldr r0, [r3]
	mov r1, ip
	str r0, [r1, #0x4c]
	mov r1, sb
	ldr r0, [r1]
	adds r0, r4, r0
	ldrb r1, [r0]
	mov r0, ip
	adds r0, #0x47
	strb r1, [r0]
	adds r4, #1
	cmp r4, #6
	ble _0806D28A
	ldr r0, _0806D338 @ =gUnknown_08580934
	ldr r0, [r0]
	ldr r2, [r0, #0x64]
	ldrb r1, [r0, #0x16]
	ldrb r0, [r0, #0x15]
	subs r1, r1, r0
	adds r1, #2
	adds r2, #0x4b
	strb r1, [r2]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D330: .4byte gUnknown_0816E18C
_0806D334: .4byte gUnknown_0816E190
_0806D338: .4byte gUnknown_08580934
_0806D33C: .4byte gUnknown_08581E94
_0806D340: .4byte gUnknown_0816E0D0
_0806D344: .4byte gUnknown_0816E0DE
_0806D348: .4byte gUnknown_085809A4

