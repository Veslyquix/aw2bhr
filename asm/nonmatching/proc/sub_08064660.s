	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064660
sub_08064660: @ 0x08064660
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x24]
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _0806467E
	ldrh r1, [r4, #0x3c]
	ldrh r0, [r4, #0x3a]
	adds r1, r1, r0
	strh r1, [r4, #0x3a]
	ldrh r0, [r4, #0x2a]
	adds r0, r0, r1
	strh r0, [r4, #0x2a]
	b _08064682
_0806467E:
	subs r0, r1, #1
	strh r0, [r4, #0x24]
_08064682:
	adds r0, r4, #0
	bl sub_080645AC
	ldrh r0, [r4, #0x2a]
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc0
	bls _080646AC
	ldr r0, _080646B4 @ =gUnknown_08580934
	ldr r1, [r0]
	adds r1, #0x2d
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bl sub_08030178
	ldr r0, _080646B8 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_080646AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080646B4: .4byte gUnknown_08580934
_080646B8: .4byte gUnknown_03001FBC

