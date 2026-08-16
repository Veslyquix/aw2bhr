	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078D40
sub_08078D40: @ 0x08078D40
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x68
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #2
	bl DivRem
	ldr r2, _08078D7C @ =gUnknown_081D92E0
	cmp r0, #0
	beq _08078D66
	ldr r1, [r2]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08078D66:
	ldr r0, [r2]
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _08078D74
	adds r0, r4, #0
	bl Proc_Break
_08078D74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078D7C: .4byte gUnknown_081D92E0

