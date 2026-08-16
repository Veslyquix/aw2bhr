	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D53C
sub_0806D53C: @ 0x0806D53C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r5, #0
	ldr r1, _0806D5DC @ =gUnknown_08580934
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	cmp r5, r0
	bge _0806D60E
	movs r0, #0
	mov sl, r0
	adds r7, r1, #0
	movs r1, #0xc8
	lsls r1, r1, #1
	mov sb, r1
	movs r2, #0
	mov r8, r2
_0806D562:
	ldr r0, _0806D5E0 @ =gUnknown_08581ECC
	movs r1, #3
	bl sub_080152EC
	adds r4, r0, #0
	strh r5, [r4, #0x1c]
	ldr r0, [r7]
	lsls r6, r5, #2
	adds r0, #0x34
	adds r0, r0, r6
	str r4, [r0]
	adds r0, r4, #0
	adds r0, #0x46
	mov r1, sl
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_08065200
	str r0, [r4, #0x2c]
	movs r0, #0x28
	strh r0, [r4, #0x2a]
	lsls r0, r5, #1
	strh r0, [r4, #0x24]
	movs r1, #0xc8
	lsls r1, r1, #1
	add r1, r8
	lsls r0, r5, #0xc
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x44
	strh r1, [r0]
	ldr r0, [r7]
	adds r0, #0x20
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0806D5E4 @ =0x000003FF
	mov r2, sb
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _0806D5E8 @ =0x06010000
	adds r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x10
	bl sub_08043E3C
	ldr r0, _0806D5EC @ =0xFFFF8290
	adds r1, r6, r0
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	ldr r0, [r7]
	adds r0, #9
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #2
	bne _0806D5F4
	adds r1, r4, #0
	adds r1, #0x42
	ldr r0, _0806D5F0 @ =0x000042B0
	strh r0, [r1]
	b _0806D5FE
	.align 2, 0
_0806D5DC: .4byte gUnknown_08580934
_0806D5E0: .4byte gUnknown_08581ECC
_0806D5E4: .4byte 0x000003FF
_0806D5E8: .4byte 0x06010000
_0806D5EC: .4byte 0xFFFF8290
_0806D5F0: .4byte 0x000042B0
_0806D5F4:
	ldr r2, _0806D61C @ =0x000042A0
	adds r1, r6, r2
	adds r0, r4, #0
	adds r0, #0x42
	strh r1, [r0]
_0806D5FE:
	movs r0, #0x24
	add sb, r0
	add r8, r0
	adds r5, #1
	ldr r0, [r7]
	ldrb r0, [r0, #8]
	cmp r5, r0
	blt _0806D562
_0806D60E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D61C: .4byte 0x000042A0

