	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806630C
sub_0806630C: @ 0x0806630C
	push {lr}
	ldr r0, _08066324 @ =gUnknown_08580934
	ldr r0, [r0]
	adds r0, #0x26
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08066328
	cmp r0, #1
	beq _0806632E
	b _08066332
	.align 2, 0
_08066324: .4byte gUnknown_08580934
_08066328:
	bl sub_08065F88
	b _08066332
_0806632E:
	bl sub_08066220
_08066332:
	pop {r0}
	bx r0
	.align 2, 0

