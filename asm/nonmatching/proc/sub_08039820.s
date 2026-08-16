	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039820
sub_08039820: @ 0x08039820
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08039840 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _08039844
	adds r0, r4, #0
	bl sub_08039850
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803984A
	adds r0, r4, #0
	bl sub_080398D0
	b _0803984A
	.align 2, 0
_08039840: .4byte gUnknown_03003FC0
_08039844:
	adds r0, r4, #0
	bl sub_080398D0
_0803984A:
	pop {r4}
	pop {r0}
	bx r0

