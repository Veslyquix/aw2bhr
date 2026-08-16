	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064FC8
sub_08064FC8: @ 0x08064FC8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x24]
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08064FDC
	subs r0, r1, #1
	strh r0, [r4, #0x24]
	b _08065018
_08064FDC:
	ldr r1, _08065020 @ =gUnknown_08580A88
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r4, #0x38]
	adds r0, r0, r1
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_08064E5C
	ldrh r0, [r4, #0x26]
	subs r0, #1
	strh r0, [r4, #0x26]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08065018
	ldr r0, _08065024 @ =gUnknown_08580934
	ldr r1, [r0]
	adds r1, #0x2d
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bl sub_08030178
	ldr r0, _08065028 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_08065018:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065020: .4byte gUnknown_08580A88
_08065024: .4byte gUnknown_08580934
_08065028: .4byte gUnknown_03001FBC

