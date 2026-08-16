	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064D74
sub_08064D74: @ 0x08064D74
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08064D8C @ =gUnknown_08580934
	ldrh r1, [r4, #0x24]
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08064D90
	subs r0, r1, #1
	strh r0, [r4, #0x24]
	b _08064DD2
	.align 2, 0
_08064D8C: .4byte gUnknown_08580934
_08064D90:
	ldr r1, _08064DB8 @ =gUnknown_085809F0
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r4, #0x38]
	adds r0, r0, r1
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_08064BF4
	ldrh r1, [r4, #0x26]
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08064DBC
	subs r0, r1, #1
	strh r0, [r4, #0x26]
	b _08064DD2
	.align 2, 0
_08064DB8: .4byte gUnknown_085809F0
_08064DBC:
	ldr r1, [r5]
	adds r1, #0x2d
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bl sub_08030178
	ldr r0, _08064DD8 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_08064DD2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064DD8: .4byte gUnknown_03001FBC

