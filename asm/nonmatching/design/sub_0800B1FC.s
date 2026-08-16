	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800B1FC
sub_0800B1FC: @ 0x0800B1FC
	push {r4, lr}
	ldr r2, _0800B224 @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #1
	ldr r4, _0800B228 @ =0x0000417A
	adds r2, r3, r4
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0800B22C @ =0x00000A22
	adds r3, r3, r0
	adds r3, r3, r1
	ldrh r0, [r3]
	cmp r0, #2
	beq _0800B220
	cmp r0, #0x20
	bne _0800B230
_0800B220:
	movs r0, #0
	b _0800B23E
	.align 2, 0
_0800B224: .4byte gUnknown_08499590
_0800B228: .4byte 0x0000417A
_0800B22C: .4byte 0x00000A22
_0800B230:
	subs r0, #0x22
	cmp r0, #1
	bls _0800B23C
	movs r0, #1
	rsbs r0, r0, #0
	b _0800B23E
_0800B23C:
	movs r0, #1
_0800B23E:
	pop {r4}
	pop {r1}
	bx r1

