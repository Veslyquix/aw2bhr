	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064F54
sub_08064F54: @ 0x08064F54
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x26]
	subs r0, #1
	strh r0, [r4, #0x26]
	movs r0, #0x26
	ldrsh r3, [r4, r0]
	movs r0, #0xb
	str r0, [sp]
	movs r0, #1
	movs r1, #0x34
	movs r2, #0x20
	bl Interpolate
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_08064E5C
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08064F9E
	ldr r0, _08064FA8 @ =gUnknown_08580934
	ldr r1, [r0]
	adds r1, #0x2d
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bl sub_08030178
	ldr r0, _08064FAC @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	movs r0, #0x34
	strh r0, [r4, #0x2a]
_08064F9E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064FA8: .4byte gUnknown_08580934
_08064FAC: .4byte gUnknown_03001FBC

