	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800BC5C
sub_0800BC5C: @ 0x0800BC5C
	push {r4, lr}
	ldr r2, _0800BC84 @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #1
	ldr r4, _0800BC88 @ =0x0000417A
	adds r2, r3, r4
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, r1, r0
	ldr r0, _0800BC8C @ =0x00001432
	adds r3, r3, r0
	adds r3, r3, r1
	ldrb r0, [r3]
	cmp r0, #0x13
	beq _0800BC7E
	cmp r0, #7
	bne _0800BC90
_0800BC7E:
	movs r0, #1
	b _0800BC92
	.align 2, 0
_0800BC84: .4byte gUnknown_08499590
_0800BC88: .4byte 0x0000417A
_0800BC8C: .4byte 0x00001432
_0800BC90:
	movs r0, #0
_0800BC92:
	pop {r4}
	pop {r1}
	bx r1

