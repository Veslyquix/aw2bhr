	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805F2B4
sub_0805F2B4: @ 0x0805F2B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	movs r0, #0
	str r0, [sp, #0xc]
	movs r1, #0xff
	str r1, [sp, #0x10]
	ldr r4, _0805F2DC @ =gUnknown_030033EC
	ldrb r0, [r4]
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805F2E0
	bl sub_0805F7B8
	b _0805F4AE
	.align 2, 0
_0805F2DC: .4byte gUnknown_030033EC
_0805F2E0:
	ldr r3, _0805F414 @ =gUnknown_085D5ABC
	ldr r2, _0805F418 @ =gUnknown_0816DAA8
	ldr r5, [r2]
	mov sl, r5
	ldr r0, [r5]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r3
	ldrb r0, [r0, #0x1a]
	adds r7, r1, #0
	cmp r0, #0x20
	bne _0805F2FC
	movs r7, #0x11
_0805F2FC:
	ldrh r1, [r4]
	ldr r0, _0805F41C @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	movs r4, #0x7f
	adds r5, r4, #0
	ands r5, r1
	adds r0, #0x2e
	ldrb r0, [r0]
	ands r4, r0
	ldr r0, _0805F420 @ =gUnknown_08499590
	mov r8, r0
	ldr r0, [r0]
	ldr r1, _0805F424 @ =0x00002D5A
	adds r0, r0, r1
	bl sub_0801F92C
	ldr r3, _0805F428 @ =gUnknown_030013EC
	mov sb, r3
	ldr r0, [sp, #0xc]
	str r0, [sp]
	ldr r6, [r3]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r3, #5
	bl _call_via_r6
	add r0, sp, #4
	bl sub_08058F30
	mov r1, r8
	ldr r0, [r1]
	ldr r3, _0805F42C @ =0x00002852
	adds r0, r0, r3
	bl sub_0801F92C
	mov r4, sl
	ldr r2, [r4]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	ldrb r2, [r2]
	add r3, sp, #4
	ldrb r3, [r3]
	ldr r5, [sp, #0xc]
	str r5, [sp]
	mov r5, sb
	ldr r4, [r5]
	bl _call_via_r4
	ldr r1, _0805F430 @ =0xFFFF0000
	ldr r0, [sp, #8]
	ands r0, r1
	ldr r1, _0805F434 @ =0x0000270F
	orrs r0, r1
	str r0, [sp, #8]
	movs r6, #0
	mov r1, r8
	ldr r0, [r1]
	mov r3, sp
	adds r3, #8
	str r3, [sp, #0x14]
	ldrh r4, [r0, #2]
	cmp r6, r4
	blt _0805F38C
	b _0805F496
_0805F38C:
	mov ip, r0
_0805F38E:
	movs r4, #0
	adds r5, r6, #1
	mov sl, r5
	mov r0, ip
	ldrh r0, [r0]
	cmp r4, r0
	bge _0805F48A
	ldr r1, _0805F438 @ =gUnknown_03003340
	ldr r7, _0805F420 @ =gUnknown_08499590
	ldr r3, [r7]
	mov sb, r3
	lsls r0, r6, #2
	adds r0, r0, r1
	mov r8, r0
_0805F3AA:
	mov r5, r8
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805F480
	ldr r2, [r7]
	lsls r1, r6, #1
	ldr r3, _0805F43C @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r3, r0, r4
	ldr r5, _0805F424 @ =0x00002D5A
	adds r0, r2, r5
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, r1, #0
	cmp r0, #0
	ble _0805F480
	ldr r0, _0805F440 @ =gUnknown_030040D8
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805F3F4
	adds r1, r0, #0
	movs r0, #0x5c
	muls r0, r1, r0
	ldr r1, _0805F414 @ =gUnknown_085D5ABC
	adds r0, r0, r1
	ldrb r0, [r0, #0x1a]
	cmp r0, #0x10
	beq _0805F44C
_0805F3F4:
	ldr r1, _0805F444 @ =0x00001432
	adds r0, r2, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	movs r1, #0x1f
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _0805F448 @ =gUnknown_085D584C
	adds r0, r0, r3
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r2, r0, #1
	b _0805F44E
	.align 2, 0
_0805F414: .4byte gUnknown_085D5ABC
_0805F418: .4byte gUnknown_0816DAA8
_0805F41C: .4byte gUnknown_08499598
_0805F420: .4byte gUnknown_08499590
_0805F424: .4byte 0x00002D5A
_0805F428: .4byte gUnknown_030013EC
_0805F42C: .4byte 0x00002852
_0805F430: .4byte 0xFFFF0000
_0805F434: .4byte 0x0000270F
_0805F438: .4byte gUnknown_03003340
_0805F43C: .4byte 0x0000417A
_0805F440: .4byte gUnknown_030040D8
_0805F444: .4byte 0x00001432
_0805F448: .4byte gUnknown_085D584C
_0805F44C:
	movs r2, #0
_0805F44E:
	ldr r0, [sp, #0xc]
	cmp r0, r2
	bgt _0805F480
	ldr r1, [r7]
	ldr r3, _0805F4C0 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r5, _0805F4C4 @ =0x00002D5A
	adds r1, r1, r5
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r3, [sp, #0x10]
	cmp r3, r0
	ble _0805F480
	str r2, [sp, #0xc]
	ldrb r1, [r1]
	str r1, [sp, #0x10]
	lsls r0, r4, #0x10
	lsls r1, r6, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r1
	str r0, [sp, #8]
_0805F480:
	adds r4, #1
	mov r5, sb
	ldrh r5, [r5]
	cmp r4, r5
	blt _0805F3AA
_0805F48A:
	mov r6, sl
	mov r0, ip
	ldrh r0, [r0, #2]
	cmp r6, r0
	bge _0805F496
	b _0805F38E
_0805F496:
	ldr r3, [sp, #0x14]
	ldrh r1, [r3]
	ldr r0, _0805F4C8 @ =0x0000270F
	cmp r1, r0
	bne _0805F4A4
	bl sub_0805F7B8
_0805F4A4:
	ldr r0, [sp, #0x14]
	bl sub_080591E4
	bl sub_0805F7B8
_0805F4AE:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F4C0: .4byte 0x0000417A
_0805F4C4: .4byte 0x00002D5A
_0805F4C8: .4byte 0x0000270F

