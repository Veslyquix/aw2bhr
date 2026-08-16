	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08054C04
sub_08054C04: @ 0x08054C04
	push {lr}
	ldr r1, _08054C2C @ =gUnknown_03004580
	ldrh r0, [r1, #6]
	ldrh r1, [r1, #0x16]
	bl sub_0804B744
	ldr r0, _08054C30 @ =gUnknown_03004504
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08054C34
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08054C38
	bl sub_08057AE8
	b _08054C38
	.align 2, 0
_08054C2C: .4byte gUnknown_03004580
_08054C30: .4byte gUnknown_03004504
_08054C34:
	bl sub_08057AE8
_08054C38:
	bl sub_08057138
	ldr r0, _08054C54 @ =gUnknown_08551A04
	ldr r0, [r0]
	ldr r1, _08054C58 @ =0x06002800
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
	bl sub_08054C5C
	pop {r0}
	bx r0
	.align 2, 0
_08054C54: .4byte gUnknown_08551A04
_08054C58: .4byte 0x06002800

