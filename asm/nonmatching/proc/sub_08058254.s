	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08058254
sub_08058254: @ 0x08058254
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r5, #0
	movs r2, #0
	ldr r0, _08058300 @ =gUnknown_03003340
	mov sl, r0
	movs r4, #1
	rsbs r4, r4, #0
	mov sb, r4
	ldr r0, _08058304 @ =gUnknown_030033EC
	ldrh r6, [r0]
_08058270:
	ldr r0, _08058308 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x2c
	ldrb r1, [r0]
	asrs r1, r2
	movs r0, #1
	ands r1, r0
	adds r7, r2, #1
	cmp r1, #0
	bne _080582EA
	lsls r3, r2, #6
	adds r4, r3, #0
	adds r4, #0x40
	cmp r3, r4
	bge _080582EA
	ldr r0, _0805830C @ =gUnknown_08499594
	ldr r1, [r0]
	ldr r0, _08058310 @ =gUnknown_0857680F
	mov r8, r0
	ldr r0, _08058314 @ =gUnknown_085D5ABC
	mov ip, r0
	lsls r0, r2, #7
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r1
	subs r3, r4, r3
_080582AC:
	ldrb r0, [r2]
	cmp r0, #2
	bls _080582E2
	adds r1, r0, #0
	mov r4, r8
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #2
	bne _080582E2
	movs r0, #0x5c
	muls r0, r1, r0
	add r0, ip
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	beq _080582E2
	ldrb r0, [r2, #3]
	lsls r0, r0, #2
	add r0, sl
	ldrb r1, [r2, #2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	beq _080582E2
	adds r5, #1
_080582E2:
	adds r2, #0xc
	subs r3, #1
	cmp r3, #0
	bne _080582AC
_080582EA:
	adds r2, r7, #0
	cmp r2, #3
	ble _08058270
	adds r0, r5, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08058300: .4byte gUnknown_03003340
_08058304: .4byte gUnknown_030033EC
_08058308: .4byte gUnknown_08499598
_0805830C: .4byte gUnknown_08499594
_08058310: .4byte gUnknown_0857680F
_08058314: .4byte gUnknown_085D5ABC

