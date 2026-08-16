	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802419C
sub_0802419C: @ 0x0802419C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	movs r5, #0
	ldr r1, _08024254 @ =gUnknown_08090A28
	ldr r2, [r1]
	ldr r0, _08024258 @ =0x0000FFFF
	adds r6, r0, #0
	ldrh r0, [r2]
	mov sl, r1
	cmp r0, r6
	beq _080241FA
	ldr r0, _0802425C @ =gUnknown_08499590
	ldr r3, [r0]
	lsls r0, r7, #0x10
	asrs r0, r0, #0xf
	ldr r4, _08024260 @ =0x0000417A
	adds r1, r3, r4
	adds r1, r1, r0
	mov r4, r8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r4, r0, #1
_080241E2:
	ldr r1, _08024264 @ =0x00000A22
	adds r0, r3, r1
	adds r0, r0, r4
	ldrh r1, [r2]
	ldrh r0, [r0]
	cmp r1, r0
	beq _080241FA
	adds r2, #2
	adds r5, #1
	ldrh r0, [r2]
	cmp r0, r6
	bne _080241E2
_080241FA:
	adds r0, r5, #0
	movs r1, #5
	bl __divsi3
	lsls r1, r0, #2
	adds r3, r1, r0
	adds r4, r3, #0
	cmp r3, #4
	bgt _08024240
	ldr r0, _0802425C @ =gUnknown_08499590
	ldr r2, [r0]
	lsls r0, r7, #0x10
	asrs r0, r0, #0xf
	ldr r5, _08024260 @ =0x0000417A
	adds r1, r2, r5
	adds r1, r1, r0
	mov r5, r8
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08024264 @ =0x00000A22
	adds r2, r2, r1
	adds r2, r2, r0
	mov r5, sl
	ldr r1, [r5]
	mov r5, sb
	lsrs r0, r5, #5
	adds r0, #0xa
	adds r0, r3, r0
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_08024240:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08024254: .4byte gUnknown_08090A28
_08024258: .4byte 0x0000FFFF
_0802425C: .4byte gUnknown_08499590
_08024260: .4byte 0x0000417A
_08024264: .4byte 0x00000A22

