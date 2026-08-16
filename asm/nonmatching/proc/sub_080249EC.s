	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080249EC
sub_080249EC: @ 0x080249EC
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r1, _08024A20 @ =gUnknown_085D5ABC
	movs r0, #0x5c
	muls r0, r2, r0
	adds r0, r0, r1
	ldrb r0, [r0, #0x1a]
	cmp r0, #0x10
	beq _08024A28
	ldr r2, _08024A24 @ =gUnknown_085D583C
	lsls r1, r3, #0x18
	asrs r1, r1, #0x18
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x10
	adds r0, r0, r2
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #0x19
	asrs r0, r0, #0x18
	b _08024A2A
	.align 2, 0
_08024A20: .4byte gUnknown_085D5ABC
_08024A24: .4byte gUnknown_085D583C
_08024A28:
	movs r0, #0
_08024A2A:
	bx lr

