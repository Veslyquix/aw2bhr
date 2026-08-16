	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080399F8
sub_080399F8: @ 0x080399F8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08039A44 @ =gUnknown_080A29A4
	ldr r1, _08039A48 @ =gUnknown_03002B6C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _08039A4C @ =0x000003FF
	ands r2, r5
	lsls r2, r2, #5
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r2, r2, r3
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011E54
	ldr r0, _08039A50 @ =gUnknown_08499578
	ldr r0, [r0]
	ldr r1, _08039A54 @ =gUnknown_080A31A4
	lsls r4, r4, #0xc
	orrs r4, r5
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_08012B70
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08039A44: .4byte gUnknown_080A29A4
_08039A48: .4byte gUnknown_03002B6C
_08039A4C: .4byte 0x000003FF
_08039A50: .4byte gUnknown_08499578
_08039A54: .4byte gUnknown_080A31A4

