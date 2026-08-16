	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027904
sub_08027904: @ 0x08027904
	push {r4, r5, lr}
	ldr r4, _08027970 @ =gUnknown_03002020
	ldr r3, _08027974 @ =gUnknown_03001470
	ldr r2, _08027978 @ =gUnknown_03001FBC
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r3
	movs r5, #0x1e
	ldrsh r1, [r0, r5]
	cmp r1, #0
	bge _08027922
	adds r1, #3
_08027922:
	asrs r1, r1, #2
	movs r0, #8
	subs r0, r0, r1
	strh r0, [r4]
	ldr r4, _0802797C @ =gUnknown_03002B28
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r3
	movs r1, #0x1e
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _08027942
	adds r0, #3
_08027942:
	asrs r0, r0, #2
	adds r0, #8
	strh r0, [r4]
	movs r5, #0
	ldrsh r0, [r2, r5]
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
	ble _08027968
	ldrb r0, [r2]
	bl sub_08015C30
_08027968:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08027970: .4byte gUnknown_03002020
_08027974: .4byte gUnknown_03001470
_08027978: .4byte gUnknown_03001FBC
_0802797C: .4byte gUnknown_03002B28

