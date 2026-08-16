	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080646D4
sub_080646D4: @ 0x080646D4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x24]
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _080646E8
	subs r0, r1, #1
	strh r0, [r4, #0x24]
	b _08064724
_080646E8:
	ldr r1, _0806472C @ =gUnknown_08580948
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r4, #0x38]
	adds r0, r0, r1
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_080645AC
	ldrh r0, [r4, #0x26]
	subs r0, #1
	strh r0, [r4, #0x26]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08064724
	ldr r0, _08064730 @ =gUnknown_08580934
	ldr r1, [r0]
	adds r1, #0x2d
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bl sub_08030178
	ldr r0, _08064734 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_08064724:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806472C: .4byte gUnknown_08580948
_08064730: .4byte gUnknown_08580934
_08064734: .4byte gUnknown_03001FBC

