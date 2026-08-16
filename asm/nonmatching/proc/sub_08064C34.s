	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064C34
sub_08064C34: @ 0x08064C34
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08064C4C @ =gUnknown_08580934
	ldrh r1, [r4, #0x24]
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08064C50
	subs r0, r1, #1
	strh r0, [r4, #0x24]
	b _08064C8E
	.align 2, 0
_08064C4C: .4byte gUnknown_08580934
_08064C50:
	ldr r1, _08064C74 @ =gUnknown_085809D8
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_08064BF4
	ldrh r1, [r4, #0x26]
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08064C78
	subs r0, r1, #1
	strh r0, [r4, #0x26]
	b _08064C8E
	.align 2, 0
_08064C74: .4byte gUnknown_085809D8
_08064C78:
	ldr r1, [r5]
	adds r1, #0x2d
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bl sub_08030178
	ldr r0, _08064C94 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_08064C8E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064C94: .4byte gUnknown_03001FBC

