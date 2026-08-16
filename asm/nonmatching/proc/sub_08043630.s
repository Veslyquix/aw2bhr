	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043630
sub_08043630: @ 0x08043630
	ldr r2, _08043650 @ =gUnknown_085C77A0
	ldr r3, _08043654 @ =gUnknown_03003FC0
	ldrb r1, [r3, #2]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r1, r0, r2
	ldrh r0, [r1, #0x24]
	cmp r0, #0
	bne _0804365A
	adds r1, r3, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #0
	bne _08043658
	movs r0, #0
	b _0804365A
	.align 2, 0
_08043650: .4byte gUnknown_085C77A0
_08043654: .4byte gUnknown_03003FC0
_08043658:
	ldrb r0, [r1]
_0804365A:
	bx lr

