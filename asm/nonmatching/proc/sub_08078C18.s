	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078C18
sub_08078C18: @ 0x08078C18
	push {lr}
	adds r3, r0, #0
	ldr r0, _08078C4C @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	ldr r2, _08078C50 @ =gUnknown_081D92DC
	cmp r0, #0
	beq _08078C32
	ldr r1, [r2]
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08078C32:
	ldr r0, [r2]
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0
	bne _08078C48
	adds r0, r3, #0
	adds r0, #0x4c
	strh r1, [r0]
	adds r0, r3, #0
	bl Proc_Break
_08078C48:
	pop {r0}
	bx r0
	.align 2, 0
_08078C4C: .4byte gUnknown_03004008
_08078C50: .4byte gUnknown_081D92DC

