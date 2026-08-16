	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080586CC
sub_080586CC: @ 0x080586CC
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r0, _08058734 @ =gUnknown_03003F2C
	ldrh r3, [r0]
	adds r4, r3, #0
	adds r4, #0x40
	cmp r3, r4
	bge _0805872C
	ldr r0, _08058738 @ =gUnknown_08499594
	ldr r1, [r0]
	ldr r0, _0805873C @ =gUnknown_0857680F
	mov ip, r0
	ldr r7, _08058740 @ =gUnknown_03003340
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r1
	movs r6, #1
	rsbs r6, r6, #0
	subs r3, r4, r3
_080586F4:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08058724
	add r0, ip
	ldrb r0, [r0]
	cmp r0, #2
	bne _08058724
	ldrb r1, [r2, #9]
	movs r0, #7
	ands r0, r1
	cmp r0, #1
	bne _08058724
	ldrb r0, [r2, #3]
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrb r1, [r2, #2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r6
	beq _08058724
	adds r5, #1
_08058724:
	adds r2, #0xc
	subs r3, #1
	cmp r3, #0
	bne _080586F4
_0805872C:
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08058734: .4byte gUnknown_03003F2C
_08058738: .4byte gUnknown_08499594
_0805873C: .4byte gUnknown_0857680F
_08058740: .4byte gUnknown_03003340

