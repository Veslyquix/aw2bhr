	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800B4F0
sub_0800B4F0: @ 0x0800B4F0
	push {r4, r5, lr}
	movs r4, #0
	ldr r2, _0800B51C @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #1
	ldr r5, _0800B520 @ =0x0000417A
	adds r2, r3, r5
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, r1, r0
	ldr r0, _0800B524 @ =0x00001432
	adds r3, r3, r0
	adds r3, r3, r1
	ldrb r0, [r3]
	cmp r0, #0xd
	bne _0800B512
	movs r4, #1
_0800B512:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800B51C: .4byte gUnknown_08499590
_0800B520: .4byte 0x0000417A
_0800B524: .4byte 0x00001432

