	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057D58
sub_08057D58: @ 0x08057D58
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #2
	beq _08057D6C
	cmp r1, #3
	bne _08057D74
	ldr r3, _08057D68 @ =gUnknown_085D6688
	b _08057D76
	.align 2, 0
_08057D68: .4byte gUnknown_085D6688
_08057D6C:
	ldr r3, _08057D70 @ =gUnknown_085D6868
	b _08057D76
	.align 2, 0
_08057D70: .4byte gUnknown_085D6868
_08057D74:
	ldr r3, _08057D8C @ =gUnknown_085D64A8
_08057D76:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r3
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08057D8C: .4byte gUnknown_085D64A8

