	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037F1C
sub_08037F1C: @ 0x08037F1C
	push {lr}
	ldr r2, _08037F4C @ =gUnknown_03004008
	ldr r0, [r2]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08037F32
	ldr r1, _08037F50 @ =gUnknown_0300200C
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08037F32:
	ldr r0, [r2]
	movs r1, #3
	bl DivRem
	cmp r0, #0
	bne _08037F46
	ldr r1, _08037F54 @ =gUnknown_03002000
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08037F46:
	pop {r0}
	bx r0
	.align 2, 0
_08037F4C: .4byte gUnknown_03004008
_08037F50: .4byte gUnknown_0300200C
_08037F54: .4byte gUnknown_03002000

