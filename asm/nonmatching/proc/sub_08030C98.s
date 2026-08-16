	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030C98
sub_08030C98: @ 0x08030C98
	push {r4, lr}
	ldr r0, _08030CC4 @ =gUnknown_030040C0
	movs r1, #0x66
	strh r1, [r0, #6]
	strh r1, [r0, #0xa]
	ldr r4, _08030CC8 @ =gUnknown_0849B018
	ldr r2, [r4]
	ldrb r1, [r2, #1]
	movs r1, #1
	strb r1, [r2, #1]
	bl sub_0802EA5C
	bl sub_0802EAFC
	ldr r1, [r4]
	ldrh r0, [r1, #4]
	movs r0, #3
	strh r0, [r1, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030CC4: .4byte gUnknown_030040C0
_08030CC8: .4byte gUnknown_0849B018

