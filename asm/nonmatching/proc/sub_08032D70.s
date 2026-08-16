	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032D70
sub_08032D70: @ 0x08032D70
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08032D94 @ =gUnknown_081D3C34
	ldr r1, _08032D98 @ =0x06015780
	bl Decompress
	ldr r0, _08032D9C @ =gUnknown_0849B6B0
	bl Proc_Find
	movs r1, #1
	str r1, [r0, #0x58]
	movs r0, #0
	str r0, [r4, #0x2c]
	adds r4, #0x29
	strb r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032D94: .4byte gUnknown_081D3C34
_08032D98: .4byte 0x06015780
_08032D9C: .4byte gUnknown_0849B6B0

