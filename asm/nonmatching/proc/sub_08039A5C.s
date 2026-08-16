	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039A5C
sub_08039A5C: @ 0x08039A5C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov sb, r1
	adds r5, r2, #0
	adds r4, r3, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r2, _08039ABC @ =gUnknown_030043F8
	movs r1, #0
	str r1, [r2]
	ldr r1, _08039AC0 @ =0x000003FF
	mov r8, r1
	adds r1, r5, #0
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #5
	ldr r6, _08039AC4 @ =0x06010000
	adds r1, r1, r6
	bl Decompress
	adds r4, #0x10
	lsls r4, r4, #0x15
	lsrs r4, r4, #0x10
	mov r0, sb
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08039AC8 @ =gUnknown_080A534C
	adds r5, #0xc0
	mov r1, r8
	ands r5, r1
	lsls r5, r5, #5
	adds r5, r5, r6
	adds r1, r5, #0
	bl Decompress
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039ABC: .4byte gUnknown_030043F8
_08039AC0: .4byte 0x000003FF
_08039AC4: .4byte 0x06010000
_08039AC8: .4byte gUnknown_080A534C

