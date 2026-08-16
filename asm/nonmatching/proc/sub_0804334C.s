	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804334C
sub_0804334C: @ 0x0804334C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08043388 @ =gUnknown_08499594
	ldr r1, [r4]
	ldr r0, [r0]
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	bl sub_08043050
	movs r1, #0x40
	ands r1, r0
	movs r0, #0
	cmp r1, #0
	beq _08043380
	movs r1, #6
	ldrsh r0, [r4, r1]
_08043380:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08043388: .4byte gUnknown_08499594

