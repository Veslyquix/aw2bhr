	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080240B4
sub_080240B4: @ 0x080240B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	ldr r4, _08024180 @ =gUnknown_030033F8
	ldr r3, _08024184 @ =gUnknown_08090A20
	ldr r2, [r3]
	ldr r5, [r2]
	lsrs r2, r1, #0x10
	mov r8, r2
	asrs r1, r1, #0xf
	ldr r6, _08024188 @ =0x0000417A
	adds r2, r5, r6
	adds r2, r2, r1
	mov ip, r2
	ldrh r1, [r2]
	lsrs r2, r0, #0x10
	mov sl, r2
	asrs r2, r0, #0x10
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r6, _0802418C @ =0x00000A22
	adds r0, r5, r6
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [r4]
	movs r4, #0
	ldr r1, _08024190 @ =gUnknown_08090A24
	ldr r7, [r1]
	ldr r0, _08024194 @ =0x0000FFFF
	adds r6, r0, #0
	ldrh r0, [r7]
	mov sb, r3
	cmp r0, r6
	beq _0802412A
	adds r3, r7, #0
	mov r1, ip
	ldrh r0, [r1]
	adds r0, r0, r2
	lsls r2, r0, #1
_08024112:
	ldr r1, _0802418C @ =0x00000A22
	adds r0, r5, r1
	adds r0, r0, r2
	ldrh r1, [r3]
	ldrh r0, [r0]
	cmp r1, r0
	beq _0802412A
	adds r3, #2
	adds r4, #1
	ldrh r0, [r3]
	cmp r0, r6
	bne _08024112
_0802412A:
	adds r0, r4, #0
	movs r1, #5
	bl __divsi3
	lsls r2, r0, #2
	adds r2, r2, r0
	mov r4, sb
	ldr r0, [r4]
	ldr r3, [r0]
	mov r6, r8
	lsls r0, r6, #0x10
	asrs r0, r0, #0xf
	ldr r4, _08024188 @ =0x0000417A
	adds r1, r3, r4
	adds r1, r1, r0
	mov r6, sl
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0802418C @ =0x00000A22
	adds r3, r3, r1
	adds r3, r3, r0
	ldr r1, _08024198 @ =gUnknown_08499B0C
	ldr r4, [sp]
	lsrs r0, r4, #5
	adds r0, r2, r0
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r2, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08024180: .4byte gUnknown_030033F8
_08024184: .4byte gUnknown_08090A20
_08024188: .4byte 0x0000417A
_0802418C: .4byte 0x00000A22
_08024190: .4byte gUnknown_08090A24
_08024194: .4byte 0x0000FFFF
_08024198: .4byte gUnknown_08499B0C

