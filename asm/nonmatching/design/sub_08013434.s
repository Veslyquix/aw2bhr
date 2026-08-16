	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013434
sub_08013434: @ 0x08013434
	ldr r1, _08013478 @ =gUnknown_030030C8
	movs r0, #0xa
	str r0, [r1]
	ldr r1, _0801347C @ =gUnknown_03002F94
	movs r0, #4
	str r0, [r1]
	movs r0, #0
	ldr r3, _08013480 @ =gUnknown_03002040
	movs r2, #0
_08013446:
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r2, [r0, #6]
	strh r2, [r0]
	strh r2, [r0, #4]
	strh r2, [r0, #0x10]
	strh r2, [r0, #2]
	strh r2, [r0, #0xe]
	strh r2, [r0, #8]
	strh r2, [r0, #0xc]
	strh r2, [r0, #0xa]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _08013446
	ldr r1, _08013484 @ =gpKeySt
	ldr r0, _08013488 @ =gUnknown_03002090
	str r0, [r1]
	bx lr
	.align 2, 0
_08013478: .4byte gUnknown_030030C8
_0801347C: .4byte gUnknown_03002F94
_08013480: .4byte gUnknown_03002040
_08013484: .4byte gpKeySt
_08013488: .4byte gUnknown_03002090

