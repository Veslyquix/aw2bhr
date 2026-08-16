	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805BBF8
sub_0805BBF8: @ 0x0805BBF8
	push {r4, lr}
	adds r2, r0, #0
	cmp r2, #0
	blt _0805BC74
	cmp r1, #0
	blt _0805BC74
	ldr r0, _0805BC60 @ =gUnknown_08499590
	ldr r3, [r0]
	ldrh r0, [r3]
	cmp r2, r0
	bge _0805BC74
	ldrh r4, [r3, #2]
	cmp r1, r4
	bge _0805BC74
	lsls r1, r1, #1
	ldr r4, _0805BC64 @ =0x0000417A
	adds r0, r3, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r0, r2
	adds r0, r3, #0
	adds r0, #0x12
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805BC74
	ldr r0, _0805BC68 @ =gUnknown_085D3DD0
	movs r2, #0xaa
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r4, _0805BC6C @ =0x00001432
	adds r0, r3, r4
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0x1f
	ands r1, r0
	ldr r0, _0805BC70 @ =gUnknown_085D5ABC
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r2, r2, r1
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0805BC74
	movs r0, #1
	b _0805BC76
	.align 2, 0
_0805BC60: .4byte gUnknown_08499590
_0805BC64: .4byte 0x0000417A
_0805BC68: .4byte gUnknown_085D3DD0
_0805BC6C: .4byte 0x00001432
_0805BC70: .4byte gUnknown_085D5ABC
_0805BC74:
	movs r0, #0
_0805BC76:
	pop {r4}
	pop {r1}
	bx r1

