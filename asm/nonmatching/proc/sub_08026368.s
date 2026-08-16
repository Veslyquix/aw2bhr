	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026368
sub_08026368: @ 0x08026368
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08026398 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r2, r1, r2
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r2, #0x36
	adds r0, r0, r1
	ldrb r2, [r2]
	adds r1, r0, r2
	ldr r0, _0802639C @ =0x000003E7
	cmp r1, r0
	bls _08026394
	ldr r1, _080263A0 @ =0x0000270F
_08026394:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_08026398: .4byte gUnknown_08499598
_0802639C: .4byte 0x000003E7
_080263A0: .4byte 0x0000270F

