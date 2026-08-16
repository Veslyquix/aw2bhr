	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800BC98
sub_0800BC98: @ 0x0800BC98
	push {r4, lr}
	ldr r2, _0800BCBC @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #1
	ldr r4, _0800BCC0 @ =0x0000417A
	adds r2, r3, r4
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, r1, r0
	ldr r0, _0800BCC4 @ =0x00001432
	adds r3, r3, r0
	adds r3, r3, r1
	ldrb r0, [r3]
	cmp r0, #7
	bne _0800BCC8
	movs r0, #1
	b _0800BCCA
	.align 2, 0
_0800BCBC: .4byte gUnknown_08499590
_0800BCC0: .4byte 0x0000417A
_0800BCC4: .4byte 0x00001432
_0800BCC8:
	movs r0, #0
_0800BCCA:
	pop {r4}
	pop {r1}
	bx r1

