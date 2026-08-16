	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035124
sub_08035124: @ 0x08035124
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0803513C
	ldr r0, _08035140 @ =gUnknown_03003FC0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, r1
	beq _0803513C
	bl sub_080350E4
_0803513C:
	pop {r0}
	bx r0
	.align 2, 0
_08035140: .4byte gUnknown_03003FC0

