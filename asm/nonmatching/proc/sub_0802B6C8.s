	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802B6C8
sub_0802B6C8: @ 0x0802B6C8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _0802B6F0 @ =gUnknown_08499590
	ldr r3, [r2]
	lsrs r1, r1, #0x17
	ldr r4, _0802B6F4 @ =0x0000417A
	adds r2, r3, r4
	adds r2, r2, r1
	lsrs r0, r0, #0x18
	ldrh r2, [r2]
	adds r0, r0, r2
	adds r3, #0x12
	adds r3, r3, r0
	ldrb r0, [r3]
	cmp r0, #0
	bne _0802B6F8
	movs r0, #0
	b _0802B74A
	.align 2, 0
_0802B6F0: .4byte gUnknown_08499590
_0802B6F4: .4byte 0x0000417A
_0802B6F8:
	ldr r2, _0802B740 @ =gUnknown_08499594
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r4, r1, r0
	subs r1, r4, r1
	lsls r2, r1, #2
	adds r2, r2, r1
	lsls r0, r2, #4
	adds r2, r2, r0
	lsls r0, r2, #8
	adds r2, r2, r0
	lsls r0, r2, #0x10
	adds r2, r2, r0
	rsbs r2, r2, #0
	asrs r2, r2, #8
	adds r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r4]
	ldr r1, _0802B744 @ =gUnknown_030033EC
	ldrh r1, [r1]
	bl sub_0802706C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802B748
	ldrb r1, [r4, #7]
	ldrb r0, [r4, #8]
	orrs r0, r1
	cmp r0, #0
	bne _0802B748
	movs r0, #1
	b _0802B74A
	.align 2, 0
_0802B740: .4byte gUnknown_08499594
_0802B744: .4byte gUnknown_030033EC
_0802B748:
	movs r0, #2
_0802B74A:
	pop {r4}
	pop {r1}
	bx r1

