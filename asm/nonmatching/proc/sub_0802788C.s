	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802788C
sub_0802788C: @ 0x0802788C
	push {r4, r5, lr}
	ldr r4, _080278F4 @ =gUnknown_03002020
	ldr r3, _080278F8 @ =gUnknown_03001470
	ldr r2, _080278FC @ =gUnknown_03001FBC
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r3
	movs r1, #0x1e
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _080278AA
	adds r0, #3
_080278AA:
	asrs r0, r0, #2
	strh r0, [r4]
	ldr r4, _08027900 @ =gUnknown_03002B28
	movs r5, #0
	ldrsh r1, [r2, r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r3
	movs r5, #0x1e
	ldrsh r1, [r0, r5]
	cmp r1, #0
	bge _080278C6
	adds r1, #3
_080278C6:
	asrs r1, r1, #2
	movs r0, #0x10
	subs r0, r0, r1
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r3
	ldrh r0, [r1, #0x1e]
	adds r0, #1
	strh r0, [r1, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	ble _080278EE
	ldrb r0, [r2]
	bl sub_08015C30
_080278EE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080278F4: .4byte gUnknown_03002020
_080278F8: .4byte gUnknown_03001470
_080278FC: .4byte gUnknown_03001FBC
_08027900: .4byte gUnknown_03002B28

