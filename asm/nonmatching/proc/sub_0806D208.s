	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D208
sub_0806D208: @ 0x0806D208
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x24]
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0806D21C
	subs r0, r1, #1
	strh r0, [r4, #0x24]
	b _0806D254
_0806D21C:
	ldr r1, [r4, #0x2c]
	ldr r2, _0806D25C @ =gUnknown_08581E70
	movs r3, #0x26
	ldrsh r0, [r4, r3]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r1, r0
	strh r1, [r4, #0x28]
	adds r0, r4, #0
	bl sub_0806D0D8
	ldrh r0, [r4, #0x26]
	subs r0, #1
	strh r0, [r4, #0x26]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0806D254
	ldr r0, _0806D260 @ =gUnknown_08580934
	ldr r1, [r0]
	adds r1, #0x2d
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, _0806D264 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_0806D254:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D25C: .4byte gUnknown_08581E70
_0806D260: .4byte gUnknown_08580934
_0806D264: .4byte gUnknown_03001FBC

