	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080424BC
sub_080424BC: @ 0x080424BC
	ldr r0, _080424D8 @ =gUnknown_03003F24
	ldr r1, [r0]
	ldr r0, _080424DC @ =gUnknown_03003100
	ldr r0, [r0]
	cmp r1, r0
	beq _080424D4
	ldr r0, _080424E0 @ =gUnknown_030040D8
	ldr r2, [r0]
	ldrb r1, [r2, #5]
	movs r0, #7
	ands r0, r1
	strb r0, [r2, #5]
_080424D4:
	bx lr
	.align 2, 0
_080424D8: .4byte gUnknown_03003F24
_080424DC: .4byte gUnknown_03003100
_080424E0: .4byte gUnknown_030040D8

