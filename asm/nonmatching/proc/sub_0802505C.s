	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802505C
sub_0802505C: @ 0x0802505C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _0802507C
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r4, r0, #1
	b _0802507E
_0802507C:
	movs r4, #0
_0802507E:
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08025098
	subs r0, #1
	movs r1, #0xa
	bl Div
	subs r1, r4, #1
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	b _0802509C
_08025098:
	lsls r0, r4, #0x10
	lsrs r1, r0, #0x10
_0802509C:
	ldr r0, [r5]
	bl sub_08025B24
	ldr r3, [r5]
	movs r0, #0x7f
	ldrb r1, [r5, #8]
	ands r1, r0
	ldrb r2, [r3, #4]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #4]
	ldr r3, [r5]
	ldrh r0, [r5, #0xa]
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #7
	ldrh r2, [r3, #4]
	ldr r0, _080250E4 @ =0xFFFFF87F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	ldr r3, [r5]
	ldrb r1, [r3, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	bne _080250DC
	adds r0, r3, #0
	bl sub_0804018C
_080250DC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080250E4: .4byte 0xFFFFF87F

