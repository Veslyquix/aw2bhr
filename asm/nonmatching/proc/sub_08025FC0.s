	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025FC0
sub_08025FC0: @ 0x08025FC0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r5]
	ldrb r1, [r4]
	cmp r0, r1
	bne _0802602E
	ldr r0, _08026034 @ =gUnknown_08499594
	ldr r2, [r0]
	subs r0, r5, r2
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r0, r1, #4
	adds r1, r1, r0
	lsls r0, r1, #8
	adds r1, r1, r0
	lsls r0, r1, #0x10
	adds r1, r1, r0
	rsbs r1, r1, #0
	asrs r1, r1, #2
	movs r3, #0xc0
	ands r1, r3
	subs r2, r4, r2
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r2, r0, #4
	adds r0, r0, r2
	lsls r2, r0, #8
	adds r0, r0, r2
	lsls r2, r0, #0x10
	adds r0, r0, r2
	rsbs r0, r0, #0
	asrs r0, r0, #2
	ands r0, r3
	cmp r1, r0
	bne _0802602E
	ldrb r0, [r5, #7]
	cmp r0, #0
	bne _0802602E
	ldrb r0, [r4, #7]
	cmp r0, #0
	bne _0802602E
	ldrb r1, [r4, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08026038
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	cmp r0, #9
	bne _08026038
_0802602E:
	movs r0, #0
	b _0802603A
	.align 2, 0
_08026034: .4byte gUnknown_08499594
_08026038:
	movs r0, #1
_0802603A:
	pop {r4, r5}
	pop {r1}
	bx r1

