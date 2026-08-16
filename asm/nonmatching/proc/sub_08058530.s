	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08058530
sub_08058530: @ 0x08058530
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r7, #0
	movs r5, #0
	ldr r0, _080585C4 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _080585C8 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2c
	ldrb r0, [r0]
	mov sb, r0
_08058552:
	mov r1, sb
	asrs r1, r5
	movs r0, #1
	ands r1, r0
	adds r6, r5, #1
	cmp r1, #0
	beq _080585AE
	lsls r3, r5, #6
	adds r4, r3, #0
	adds r4, #0x40
	cmp r3, r4
	bge _080585AE
	ldr r0, _080585CC @ =gUnknown_08499594
	ldr r1, [r0]
	ldr r0, _080585D0 @ =gUnknown_03003340
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	mov ip, r0
	lsls r0, r5, #7
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r1
	subs r3, r4, r3
_08058582:
	ldrb r0, [r2]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080585A6
	ldrb r0, [r2, #3]
	lsls r0, r0, #2
	add r0, r8
	ldrb r1, [r2, #2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, ip
	beq _080585A6
	adds r7, #1
_080585A6:
	adds r2, #0xc
	subs r3, #1
	cmp r3, #0
	bne _08058582
_080585AE:
	adds r5, r6, #0
	cmp r5, #3
	ble _08058552
	adds r0, r7, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080585C4: .4byte gUnknown_030033EC
_080585C8: .4byte gUnknown_08499598
_080585CC: .4byte gUnknown_08499594
_080585D0: .4byte gUnknown_03003340

