	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080707F4
sub_080707F4: @ 0x080707F4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r3, #0
	str r3, [r5]
	ldr r1, _080708AC @ =0x040000C4
	ldr r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x12
	ands r0, r2
	cmp r0, #0
	beq _08070810
	ldr r0, _080708B0 @ =0x84400004
	str r0, [r1]
_08070810:
	ldr r1, _080708B4 @ =0x040000D0
	ldr r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0807081E
	ldr r0, _080708B0 @ =0x84400004
	str r0, [r1]
_0807081E:
	ldr r0, _080708B8 @ =0x040000C6
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	ldr r1, _080708BC @ =0x04000084
	movs r0, #0x8f
	strh r0, [r1]
	subs r1, #2
	ldr r2, _080708C0 @ =0x0000A90E
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _080708C4 @ =0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080708C8 @ =0x040000BC
	movs r2, #0xd4
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _080708CC @ =0x040000A0
	str r0, [r1]
	adds r1, #8
	movs r2, #0x98
	lsls r2, r2, #4
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _080708D0 @ =0x040000A4
	str r0, [r1]
	ldr r0, _080708D4 @ =gUnknown_03007FF0
	str r5, [r0]
	str r3, [sp]
	ldr r2, _080708D8 @ =0x050003EC
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	movs r0, #8
	strb r0, [r5, #6]
	movs r0, #0xf
	strb r0, [r5, #7]
	ldr r0, _080708DC @ =sub_080700C0
	str r0, [r5, #0x38]
	ldr r0, _080708E0 @ =sub_080718E4
	str r0, [r5, #0x28]
	str r0, [r5, #0x2c]
	str r0, [r5, #0x30]
	str r0, [r5, #0x3c]
	ldr r4, _080708E4 @ =gUnknown_03005740
	adds r0, r4, #0
	bl sub_0806FBD4
	str r4, [r5, #0x34]
	movs r0, #0x80
	lsls r0, r0, #0xb
	bl sub_080708EC
	ldr r0, _080708E8 @ =0x68736D53
	str r0, [r5]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080708AC: .4byte 0x040000C4
_080708B0: .4byte 0x84400004
_080708B4: .4byte 0x040000D0
_080708B8: .4byte 0x040000C6
_080708BC: .4byte 0x04000084
_080708C0: .4byte 0x0000A90E
_080708C4: .4byte 0x04000089
_080708C8: .4byte 0x040000BC
_080708CC: .4byte 0x040000A0
_080708D0: .4byte 0x040000A4
_080708D4: .4byte gUnknown_03007FF0
_080708D8: .4byte 0x050003EC
_080708DC: .4byte sub_080700C0
_080708E0: .4byte sub_080718E4
_080708E4: .4byte gUnknown_03005740
_080708E8: .4byte 0x68736D53

