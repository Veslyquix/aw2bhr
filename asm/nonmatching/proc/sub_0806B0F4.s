	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806B0F4
sub_0806B0F4: @ 0x0806B0F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0806B10A
	bl sub_080718F0
	bl sub_080135A4
_0806B10A:
	ldr r0, [r4, #0x58]
	subs r0, #1
	str r0, [r4, #0x58]
	cmp r0, #0
	bne _0806B11A
	adds r0, r4, #0
	bl Proc_Break
_0806B11A:
	pop {r4}
	pop {r0}
	bx r0

