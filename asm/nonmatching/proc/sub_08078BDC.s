	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078BDC
sub_08078BDC: @ 0x08078BDC
	push {lr}
	adds r3, r0, #0
	ldr r0, _08078C10 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	ldr r2, _08078C14 @ =gUnknown_081D92D8
	cmp r0, #0
	beq _08078BF6
	ldr r1, [r2]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08078BF6:
	ldr r0, [r2]
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _08078C0C
	adds r1, r3, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	adds r0, r3, #0
	bl Proc_Break
_08078C0C:
	pop {r0}
	bx r0
	.align 2, 0
_08078C10: .4byte gUnknown_03004008
_08078C14: .4byte gUnknown_081D92D8

