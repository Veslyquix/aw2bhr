	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803AF00
sub_0803AF00: @ 0x0803AF00
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x20]
	movs r0, #0x65
	bl sub_0803CBA0
	ldrh r1, [r4, #0x22]
	movs r0, #0x66
	bl sub_0803CBA0
	ldrh r1, [r4, #0x24]
	movs r0, #0x68
	bl sub_0803CBA0
	ldrh r1, [r4, #0x26]
	movs r0, #0x67
	bl sub_0803CBA0
	ldr r5, _0803AF58 @ =gUnknown_0200C420
	ldrh r0, [r4, #0x28]
	str r0, [r5]
	ldrh r1, [r4, #0x28]
	ldrh r0, [r4, #0x2a]
	cmp r0, r1
	bhs _0803AF34
	strh r1, [r4, #0x2a]
_0803AF34:
	ldrh r0, [r4, #0x2a]
	str r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	cmp r0, #0
	beq _0803AF42
	bl sub_0803C890
_0803AF42:
	ldrh r0, [r4, #0x2e]
	cmp r0, #0
	bne _0803AF4E
	strb r0, [r5, #9]
	strb r0, [r5, #0xa]
	strb r0, [r5, #0xb]
_0803AF4E:
	bl sub_08016E14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803AF58: .4byte gUnknown_0200C420

