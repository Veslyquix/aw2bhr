	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803649C
sub_0803649C: @ 0x0803649C
	movs r1, #0
	ldr r2, _080364B0 @ =gUnknown_03003124
_080364A0:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080364B4
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	b _080364C2
	.align 2, 0
_080364B0: .4byte gUnknown_03003124
_080364B4:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #2
	bls _080364A0
	movs r0, #1
	rsbs r0, r0, #0
_080364C2:
	bx lr

