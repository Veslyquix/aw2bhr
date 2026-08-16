	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031F5C
sub_08031F5C: @ 0x08031F5C
	push {r4, lr}
	ldr r0, _08031F80 @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #3
	bne _08031F7A
	ldr r4, _08031F84 @ =gUnknown_0849B060
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #0xd
	movs r2, #0
	bl sub_080315E8
	ldr r1, [r4]
	strh r0, [r1]
_08031F7A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031F80: .4byte gUnknown_0849B018
_08031F84: .4byte gUnknown_0849B060

