	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031F28
sub_08031F28: @ 0x08031F28
	push {r4, lr}
	movs r0, #0x6c
	bl sub_0803B4DC
	ldr r0, _08031F54 @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #3
	bne _08031F4C
	ldr r4, _08031F58 @ =gUnknown_0849B060
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #0xc
	movs r2, #2
	bl sub_080315E8
	ldr r1, [r4]
	strh r0, [r1]
_08031F4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031F54: .4byte gUnknown_0849B018
_08031F58: .4byte gUnknown_0849B060

