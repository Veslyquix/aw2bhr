	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042424
sub_08042424: @ 0x08042424
	push {r4, lr}
	ldr r2, _08042464 @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	ldr r4, _08042468 @ =0x0000417A
	adds r2, r3, r4
	adds r2, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r2]
	adds r0, r0, r2
	ldr r1, _0804246C @ =0x00001432
	adds r3, r3, r1
	adds r3, r3, r0
	ldrb r3, [r3]
	movs r0, #0xe0
	ldr r1, _08042470 @ =gUnknown_03004084
	ands r0, r3
	ldrh r1, [r1]
	cmp r0, r1
	bne _08042474
	movs r0, #0x1f
	ands r0, r3
	cmp r0, #0xa
	blt _08042474
	cmp r0, #0xb
	ble _08042460
	cmp r0, #0xe
	bne _08042474
_08042460:
	movs r0, #1
	b _08042476
	.align 2, 0
_08042464: .4byte gUnknown_08499590
_08042468: .4byte 0x0000417A
_0804246C: .4byte 0x00001432
_08042470: .4byte gUnknown_03004084
_08042474:
	movs r0, #0
_08042476:
	pop {r4}
	pop {r1}
	bx r1

