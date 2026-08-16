	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08021D64
sub_08021D64: @ 0x08021D64
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08021D94 @ =gUnknown_080C1FC4
	lsls r3, r0, #0xc
	adds r3, r3, r1
	ldr r1, _08021D98 @ =gUnknown_0300251C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #1
	ands r2, r0
	lsls r2, r2, #0xc
	ldr r0, _08021D9C @ =0x06002000
	adds r2, r2, r0
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r3, #0
	bl sub_08011C68
	pop {r0}
	bx r0
	.align 2, 0
_08021D94: .4byte gUnknown_080C1FC4
_08021D98: .4byte gUnknown_0300251C
_08021D9C: .4byte 0x06002000

