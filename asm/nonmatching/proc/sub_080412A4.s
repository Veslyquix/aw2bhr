	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080412A4
sub_080412A4: @ 0x080412A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080412D4 @ =gUnknown_0849FD44
	bl Proc_Find
	adds r3, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r2, r0, #1
	strh r2, [r1]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _080412D8
	adds r1, r3, #0
	adds r1, #0x42
	movs r0, #0
	strh r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _080412E2
	.align 2, 0
_080412D4: .4byte gUnknown_0849FD44
_080412D8:
	movs r0, #1
	ands r2, r0
	adds r0, r3, #0
	adds r0, #0x42
	strh r2, [r0]
_080412E2:
	pop {r4}
	pop {r0}
	bx r0

