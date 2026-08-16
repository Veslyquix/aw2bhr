	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CEFC
sub_0802CEFC: @ 0x0802CEFC
	push {r4, lr}
	bl sub_0801A168
	ldr r1, _0802CF38 @ =gUnknown_030044B0
	ldr r0, _0802CF3C @ =gUnknown_03001FD4
	ldr r0, [r0]
	str r0, [r1, #8]
	ldr r0, _0802CF40 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	ldr r4, _0802CF44 @ =gUnknown_08090BFC
	cmp r0, #0
	beq _0802CF24
	ldr r0, [r4]
	ldrb r2, [r0]
	movs r0, #0x10
	movs r1, #0
	movs r3, #0
	bl sub_08034534
_0802CF24:
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #2
	bl sub_0804438C
	bl sub_08024268
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CF38: .4byte gUnknown_030044B0
_0802CF3C: .4byte gUnknown_03001FD4
_0802CF40: .4byte gUnknown_03003FC0
_0802CF44: .4byte gUnknown_08090BFC

