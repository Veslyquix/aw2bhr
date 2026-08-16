	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08038848
sub_08038848: @ 0x08038848
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r2, _080388DC @ =gUnknown_0849D5F8
	ldr r1, [r2]
	adds r1, #0x45
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x45
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x20
	adds r0, r0, r1
	strb r6, [r0]
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x45
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x2c
	adds r0, r0, r1
	strb r5, [r0]
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x45
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x38
	adds r2, r1, r0
	mov r8, r2
	subs r0, #1
	adds r7, r1, r0
	ldr r3, _080388E0 @ =gUnknown_085D3DD0
	mov ip, r3
	ldr r3, _080388E4 @ =gUnknown_03003FC0
	adds r4, r3, #0
	adds r4, #0x2c
	ldr r0, _080388E8 @ =gUnknown_03003F38
	ldrb r1, [r0]
	lsrs r1, r1, #6
	ldr r0, _080388EC @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	ldrb r4, [r4]
	adds r0, r0, r4
	lsls r4, r0, #2
	ldrb r0, [r3, #8]
	cmp r0, #0
	beq _080388F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #6
	adds r0, r0, r1
	lsls r0, r0, #2
	b _080388F4
	.align 2, 0
_080388DC: .4byte gUnknown_0849D5F8
_080388E0: .4byte gUnknown_085D3DD0
_080388E4: .4byte gUnknown_03003FC0
_080388E8: .4byte gUnknown_03003F38
_080388EC: .4byte gUnknown_08499598
_080388F0:
	movs r0, #0x82
	lsls r0, r0, #1
_080388F4:
	adds r1, r4, r0
	mov r0, ip
	adds r0, #0x50
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r0, _0803894C @ =gUnknown_08499590
	ldr r2, [r0]
	lsls r0, r5, #0x18
	asrs r0, r0, #0x17
	ldr r3, _08038950 @ =0x0000417A
	adds r1, r2, r3
	adds r1, r1, r0
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _08038954 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r0, [r2]
	movs r1, #0x1f
	ands r1, r0
	ldr r3, _08038958 @ =gUnknown_085D5ABC
	ldr r0, _0803895C @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r2, [r0]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0, #0x19]
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r4, r4, r1
	ldrb r0, [r7]
	ldrb r1, [r4]
	subs r0, r0, r1
	mov r2, r8
	strb r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803894C: .4byte gUnknown_08499590
_08038950: .4byte 0x0000417A
_08038954: .4byte 0x00001432
_08038958: .4byte gUnknown_085D5ABC
_0803895C: .4byte gUnknown_030040D8

