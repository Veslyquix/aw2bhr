	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065198
sub_08065198: @ 0x08065198
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r1, [r4, #0x24]
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _080651AE
	subs r0, r1, #1
	strh r0, [r4, #0x24]
	b _080651EE
_080651AE:
	movs r2, #0x30
	rsbs r2, r2, #0
	movs r0, #0x26
	ldrsh r3, [r4, r0]
	movs r0, #0xc
	str r0, [sp]
	movs r0, #1
	movs r1, #0x34
	bl Interpolate
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_08064E5C
	ldrh r0, [r4, #0x26]
	subs r0, #1
	strh r0, [r4, #0x26]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080651EE
	ldr r0, _080651F8 @ =gUnknown_08580934
	ldr r1, [r0]
	adds r1, #0x2d
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bl sub_08030178
	ldr r0, _080651FC @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_080651EE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080651F8: .4byte gUnknown_08580934
_080651FC: .4byte gUnknown_03001FBC

