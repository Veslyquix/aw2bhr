	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08021DA0
sub_08021DA0: @ 0x08021DA0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08021DCC @ =gUnknown_080C9FC4
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #0xa
	adds r3, r3, r1
	ldr r0, _08021DD0 @ =gUnknown_0300251C
	ldr r1, [r0]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r0, _08021DD4 @ =0x06004000
	adds r1, r1, r0
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r3, #0
	bl sub_08011C68
	pop {r0}
	bx r0
	.align 2, 0
_08021DCC: .4byte gUnknown_080C9FC4
_08021DD0: .4byte gUnknown_0300251C
_08021DD4: .4byte 0x06004000

