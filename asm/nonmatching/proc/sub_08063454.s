	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063454
sub_08063454: @ 0x08063454
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x14]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	bne _0806348E
	ldrb r0, [r5, #0x1e]
	cmp r0, #0
	beq _0806348E
	adds r0, r5, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806348E
	str r6, [r5, #0x20]
	adds r2, #0xf
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r2, r0
	subs r0, #0xf0
	adds r1, r2, r0
	ldr r0, _08063498 @ =0x0003FF00
	cmp r1, r0
	bls _0806349C
_0806348E:
	adds r0, r5, #0
	bl sub_08062FB8
	b _08063510
	.align 2, 0
_08063498: .4byte 0x0003FF00
_0806349C:
	adds r0, r6, r2
	str r0, [r5, #0x24]
	lsls r1, r7, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x13
	adds r0, r1, r2
	asrs r0, r0, #0x18
	adds r2, r1, #0
	cmp r0, #8
	bhi _080634FC
	lsls r0, r0, #2
	ldr r1, _080634BC @ =_080634C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080634BC: .4byte _080634C0
_080634C0: @ jump table
	.4byte _080634E4 @ case 0
	.4byte _080634E4 @ case 1
	.4byte _080634E4 @ case 2
	.4byte _080634E4 @ case 3
	.4byte _080634EE @ case 4
	.4byte _080634F4 @ case 5
	.4byte _080634F4 @ case 6
	.4byte _080634F4 @ case 7
	.4byte _080634F4 @ case 8
_080634E4:
	lsls r4, r3, #3
	asrs r1, r2, #0x18
	movs r0, #3
	subs r0, r0, r1
	b _080634FA
_080634EE:
	movs r0, #0x38
	adds r4, r3, #0
	b _080634FA
_080634F4:
	lsls r4, r3, #3
	asrs r0, r2, #0x18
	subs r0, #1
_080634FA:
	orrs r4, r0
_080634FC:
	movs r0, #0x3f
	ands r4, r0
	lsls r0, r4, #1
	movs r2, #0x7f
	rsbs r2, r2, #0
	adds r1, r2, #0
	orrs r0, r1
	strb r0, [r5, #0x1c]
	movs r0, #0xd0
	strb r0, [r5, #0x18]
_08063510:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

