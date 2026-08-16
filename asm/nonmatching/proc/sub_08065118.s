	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065118
sub_08065118: @ 0x08065118
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x24]
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0806512C
	subs r0, r1, #1
	strh r0, [r4, #0x24]
	b _08065168
_0806512C:
	ldr r1, _08065170 @ =gUnknown_08580ABE
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
	bge _08065168
	ldr r0, _08065174 @ =gUnknown_08580934
	ldr r1, [r0]
	adds r1, #0x2d
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bl sub_08030178
	ldr r0, _08065178 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_08065168:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065170: .4byte gUnknown_08580ABE
_08065174: .4byte gUnknown_08580934
_08065178: .4byte gUnknown_03001FBC

