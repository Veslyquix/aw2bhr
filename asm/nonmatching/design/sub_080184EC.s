	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080184EC
sub_080184EC: @ 0x080184EC
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0xe]
	adds r2, r0, #4
	strh r2, [r1, #0xe]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2e
	ble _0801850C
	ldr r0, _08018508 @ =sub_080184E0
	str r0, [r1, #8]
	bl sub_08012A74
	b _08018526
	.align 2, 0
_08018508: .4byte sub_080184E0
_0801850C:
	ldr r1, _0801852C @ =gUnknown_0300309C
	movs r3, #0x70
	rsbs r3, r3, #0
	adds r0, r3, #0
	subs r0, r0, r2
	strh r0, [r1]
	ldr r1, _08018530 @ =gUnknown_03002028
	strh r0, [r1]
	ldr r0, _08018534 @ =gUnknown_03001420
	strh r2, [r0]
	ldr r0, _08018538 @ =sub_08017EEC
	bl sub_08011AAC
_08018526:
	pop {r0}
	bx r0
	.align 2, 0
_0801852C: .4byte gUnknown_0300309C
_08018530: .4byte gUnknown_03002028
_08018534: .4byte gUnknown_03001420
_08018538: .4byte sub_08017EEC

