	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080513FC
sub_080513FC: @ 0x080513FC
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r2, #0
	bl sub_080156C4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _08051440
	ldr r2, _08051448 @ =gUnknown_02029A10
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r5, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0, #0x1a]
	cmp r0, #0
	bne _08051440
	ldr r0, _0805144C @ =gUnknown_0300450C
	ldrh r0, [r0]
	cmp r5, r0
	bne _08051440
	ldr r0, _08051450 @ =gUnknown_02029664
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
_08051440:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08051448: .4byte gUnknown_02029A10
_0805144C: .4byte gUnknown_0300450C
_08051450: .4byte gUnknown_02029664

