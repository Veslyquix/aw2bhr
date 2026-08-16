	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024DDC
sub_08024DDC: @ 0x08024DDC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [r4]
	ldrb r1, [r0, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08024DFE
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r5, r0, #1
	b _08024E00
_08024DFE:
	movs r5, #0
_08024E00:
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	movs r7, #0xc8
	subs r0, r7, r0
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	movs r1, #0x64
	bl Div
	strh r0, [r4, #0x14]
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	muls r0, r5, r0
	movs r1, #0xa
	bl Div
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	ldr r1, _08024E58 @ =0x03E60000
	cmp r0, r1
	ble _08024E30
	ldr r0, _08024E5C @ =0x000003E7
	strh r0, [r4, #0x14]
_08024E30:
	movs r2, #0xe
	ldrsh r0, [r6, r2]
	subs r0, r7, r0
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	movs r1, #0x64
	bl Div
	strh r0, [r6, #0x12]
	ldr r1, [r6]
	ldrb r1, [r1, #4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	subs r1, r1, r0
	strh r1, [r6, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024E58: .4byte 0x03E60000
_08024E5C: .4byte 0x000003E7

