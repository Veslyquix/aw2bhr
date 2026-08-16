	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804247C
sub_0804247C: @ 0x0804247C
	push {r4, lr}
	ldr r2, _080424A8 @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	ldr r4, _080424AC @ =0x0000417A
	adds r2, r3, r4
	adds r2, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r2]
	adds r0, r0, r2
	ldr r1, _080424B0 @ =0x00001432
	adds r3, r3, r1
	adds r3, r3, r0
	ldrb r1, [r3]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0x11
	beq _080424B4
	movs r0, #0
	b _080424B6
	.align 2, 0
_080424A8: .4byte gUnknown_08499590
_080424AC: .4byte 0x0000417A
_080424B0: .4byte 0x00001432
_080424B4:
	movs r0, #1
_080424B6:
	pop {r4}
	pop {r1}
	bx r1

