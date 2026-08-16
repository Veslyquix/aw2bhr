	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035B00
sub_08035B00: @ 0x08035B00
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _08035B20 @ =gUnknown_03003FC0
	ldrb r0, [r0, #9]
	cmp r0, #1
	beq _08035B28
	ldr r0, _08035B24 @ =gUnknown_0849CD88
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x18
	ldrsh r0, [r1, r2]
	lsls r0, r0, #0x11
	asrs r0, r0, #0x10
	b _08035B36
	.align 2, 0
_08035B20: .4byte gUnknown_03003FC0
_08035B24: .4byte gUnknown_0849CD88
_08035B28:
	ldr r0, _08035B38 @ =gUnknown_0849CD88
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x18
	ldrsh r0, [r1, r2]
_08035B36:
	bx lr
	.align 2, 0
_08035B38: .4byte gUnknown_0849CD88

