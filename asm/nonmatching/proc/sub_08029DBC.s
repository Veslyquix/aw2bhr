	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029DBC
sub_08029DBC: @ 0x08029DBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08029DEC @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r0, [r2, #4]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x14
	cmp r4, r3
	blt _08029DE8
	ldrh r0, [r2, #6]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x14
	cmp r1, r2
	blt _08029DE8
	adds r0, r3, #0
	adds r0, #0xe
	cmp r4, r0
	bgt _08029DE8
	adds r0, r2, #0
	adds r0, #9
	cmp r1, r0
	ble _08029DF0
_08029DE8:
	movs r0, #0
	b _08029DF2
	.align 2, 0
_08029DEC: .4byte gUnknown_08499590
_08029DF0:
	movs r0, #1
_08029DF2:
	pop {r4}
	pop {r1}
	bx r1

