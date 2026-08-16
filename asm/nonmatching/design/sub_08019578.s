	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019578
sub_08019578: @ 0x08019578
	push {r4, r5, lr}
	ldr r4, [r0, #0x18]
	movs r2, #0
	strh r2, [r4]
	adds r1, r4, #0
	adds r1, #0x40
	strh r2, [r1]
	strh r2, [r4, #8]
	adds r1, #8
	strh r2, [r1]
	movs r1, #0x1e
	ldrsh r2, [r0, r1]
	lsls r2, r2, #3
	adds r2, r2, r4
	ldrh r1, [r0, #0x30]
	ldr r5, _080195C0 @ =0x00000209
	adds r3, r5, #0
	orrs r1, r3
	strh r1, [r2]
	movs r2, #0x1e
	ldrsh r1, [r0, r2]
	lsls r1, r1, #3
	adds r1, r1, r4
	adds r1, #0x40
	ldrh r2, [r0, #0x30]
	ldr r4, _080195C4 @ =0x0000020A
	adds r3, r4, #0
	orrs r2, r3
	strh r2, [r1]
	ldr r0, [r0, #0x2c]
	bl _call_via_r0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080195C0: .4byte 0x00000209
_080195C4: .4byte 0x0000020A

