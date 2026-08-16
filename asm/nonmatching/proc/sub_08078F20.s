	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078F20
sub_08078F20: @ 0x08078F20
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #4
	bl DivRem
	ldr r2, _08078F5C @ =gUnknown_081D92E4
	cmp r0, #0
	bne _08078F40
	ldr r1, [r2]
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08078F40:
	ldr r0, [r2]
	ldrh r0, [r0]
	cmp r0, #0
	bne _08078F4E
	adds r0, r5, #0
	bl Proc_Break
_08078F4E:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078F5C: .4byte gUnknown_081D92E4

