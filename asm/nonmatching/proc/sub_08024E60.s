	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024E60
sub_08024E60: @ 0x08024E60
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08024E88
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	adds r0, #1
	muls r0, r1, r0
	b _08024E8A
_08024E88:
	movs r0, #0
_08024E8A:
	movs r1, #0xa
	bl Div
	strh r0, [r5, #0xc]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08024DDC
	movs r1, #8
	ldrsh r0, [r4, r1]
	movs r1, #0
	cmp r0, #0
	blt _08024EA6
	ldrh r1, [r4, #8]
_08024EA6:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	beq _08024EC0
	subs r0, #1
	movs r1, #0xa
	bl Div
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	adds r0, #1
	muls r0, r1, r0
	b _08024EC2
_08024EC0:
	movs r0, #0
_08024EC2:
	movs r1, #0xa
	bl Div
	strh r0, [r4, #0xc]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08024DDC
	pop {r4, r5}
	pop {r0}
	bx r0

