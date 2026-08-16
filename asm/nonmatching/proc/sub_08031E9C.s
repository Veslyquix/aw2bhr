	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031E9C
sub_08031E9C: @ 0x08031E9C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08031ECC @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08031EBA
	bl sub_080718F0
	bl sub_080135A4
	ldr r0, [r4, #0x58]
	subs r0, #1
	str r0, [r4, #0x58]
_08031EBA:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	bne _08031EC6
	adds r0, r4, #0
	bl Proc_Break
_08031EC6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031ECC: .4byte gUnknown_03004008

