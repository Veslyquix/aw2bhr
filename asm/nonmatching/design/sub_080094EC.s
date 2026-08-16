	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080094EC
sub_080094EC: @ 0x080094EC
	push {r4, lr}
	ldr r2, _0800952C @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #1
	ldr r4, _08009530 @ =0x0000417A
	adds r2, r3, r4
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08009534 @ =0x00000A22
	adds r3, r3, r0
	adds r3, r3, r1
	ldrh r1, [r3]
	movs r2, #0
	adds r0, r1, #0
	subs r0, #0xfc
	cmp r0, #1
	bls _08009520
	movs r0, #0x8e
	lsls r0, r0, #1
	cmp r1, r0
	beq _08009520
	adds r0, #1
	cmp r1, r0
	bne _08009522
_08009520:
	movs r2, #1
_08009522:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800952C: .4byte gUnknown_08499590
_08009530: .4byte 0x0000417A
_08009534: .4byte 0x00000A22

