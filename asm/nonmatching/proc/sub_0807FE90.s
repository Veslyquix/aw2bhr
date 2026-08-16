	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807FE90
sub_0807FE90: @ 0x0807FE90
	push {r4, lr}
	sub sp, #4
	ldr r3, _0807FF40 @ =gUnknown_030030E0
	ldrb r1, [r3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _0807FF44 @ =gUnknown_03002020
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0807FF48 @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	ldr r1, _0807FF4C @ =gUnknown_03001FFC
	ldrh r0, [r1]
	strh r0, [r1]
	ldrh r1, [r3]
	ldr r0, _0807FF50 @ =0x0000FFE0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strh r0, [r3]
	ldrb r1, [r3]
	movs r2, #0x21
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldrh r1, [r3]
	ldr r0, _0807FF54 @ =0x0000E0FF
	ands r0, r1
	movs r4, #0xf0
	lsls r4, r4, #5
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	ldrb r0, [r3, #1]
	ands r2, r0
	strb r2, [r3, #1]
	ldr r2, _0807FF58 @ =gUnknown_030030CC
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _0807FF5C @ =gUnknown_080A29A4
	ldr r1, _0807FF60 @ =gUnknown_03002B6C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _0807FF64 @ =0x06005600
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011E54
	ldr r0, _0807FF68 @ =gUnknown_08499578
	ldr r0, [r0]
	ldr r1, _0807FF6C @ =gUnknown_080A31A4
	ldr r2, _0807FF70 @ =0x000082B0
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_08012B70
	ldr r0, _0807FF74 @ =gUnknown_080A36C8
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_08013618
	bl sub_08013AEC
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FF40: .4byte gUnknown_030030E0
_0807FF44: .4byte gUnknown_03002020
_0807FF48: .4byte gUnknown_03002B28
_0807FF4C: .4byte gUnknown_03001FFC
_0807FF50: .4byte 0x0000FFE0
_0807FF54: .4byte 0x0000E0FF
_0807FF58: .4byte gUnknown_030030CC
_0807FF5C: .4byte gUnknown_080A29A4
_0807FF60: .4byte gUnknown_03002B6C
_0807FF64: .4byte 0x06005600
_0807FF68: .4byte gUnknown_08499578
_0807FF6C: .4byte gUnknown_080A31A4
_0807FF70: .4byte 0x000082B0
_0807FF74: .4byte gUnknown_080A36C8

