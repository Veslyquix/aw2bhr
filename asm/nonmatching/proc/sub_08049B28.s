	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049B28
sub_08049B28: @ 0x08049B28
	push {lr}
	bl sub_080733B8
	ldr r1, _08049B5C @ =gUnknown_084C30E8
	ldr r0, _08049B60 @ =gUnknown_084C30F8
	ldr r0, [r0]
	ldr r2, _08049B64 @ =0x0000083A
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_0801930C
	ldr r0, _08049B68 @ =gUnknown_084C3128
	bl sub_0801537C
	ldr r2, _08049B6C @ =gUnknown_0200C420
	ldrb r1, [r2, #0xf]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _08049B58
	adds r0, r1, #1
	strb r0, [r2, #0xf]
_08049B58:
	pop {r0}
	bx r0
	.align 2, 0
_08049B5C: .4byte gUnknown_084C30E8
_08049B60: .4byte gUnknown_084C30F8
_08049B64: .4byte 0x0000083A
_08049B68: .4byte gUnknown_084C3128
_08049B6C: .4byte gUnknown_0200C420

