	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039588
sub_08039588: @ 0x08039588
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #6
	bl sub_08014E44
	mov sb, r0
	movs r4, #0
	movs r2, #0
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	beq _08039620
	ldr r0, _080395F4 @ =gUnknown_08090F30
	mov sl, r0
_080395AE:
	mov r0, r8
	adds r1, r0, r2
	ldrb r0, [r1]
	subs r0, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r1, #0
	adds r7, r2, #1
	cmp r0, #8
	bls _08039612
	movs r2, #0
	mov r1, sl
	ldrb r0, [r1]
	adds r6, r4, #1
	cmp r0, #0
	beq _0803960E
	ldr r3, _080395F4 @ =gUnknown_08090F30
	lsls r0, r4, #8
	ldr r1, _080395F8 @ =0x00006140
	adds r4, r0, r1
_080395D6:
	adds r1, r2, r3
	ldrb r0, [r5]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08039600
	lsls r0, r2, #8
	add r0, sb
	ldr r2, _080395FC @ =0x06010000
	adds r1, r4, r2
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_08011C68
	b _0803960E
	.align 2, 0
_080395F4: .4byte gUnknown_08090F30
_080395F8: .4byte 0x00006140
_080395FC: .4byte 0x06010000
_08039600:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _080395D6
_0803960E:
	lsls r0, r6, #0x10
	lsrs r4, r0, #0x10
_08039612:
	lsls r0, r7, #0x10
	lsrs r2, r0, #0x10
	mov r1, r8
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080395AE
_08039620:
	mov r0, sb
	bl sub_08014ED4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

