	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025598
sub_08025598: @ 0x08025598
	push {r4, lr}
	ldr r2, _080255DC @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	ldr r4, _080255E0 @ =0x0000417A
	adds r2, r3, r4
	adds r2, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r2]
	adds r0, r0, r2
	ldr r1, _080255E4 @ =0x0000051A
	adds r3, r3, r1
	adds r3, r3, r0
	ldrb r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080255D8
	lsrs r1, r0, #0x16
	ldr r0, _080255E8 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x58
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080255EC
_080255D8:
	movs r0, #0
	b _080255EE
	.align 2, 0
_080255DC: .4byte gUnknown_08499590
_080255E0: .4byte 0x0000417A
_080255E4: .4byte 0x0000051A
_080255E8: .4byte gUnknown_08499598
_080255EC:
	movs r0, #1
_080255EE:
	pop {r4}
	pop {r1}
	bx r1

