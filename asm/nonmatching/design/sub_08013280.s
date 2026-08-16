	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013280
sub_08013280: @ 0x08013280
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x66
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _08013298
	adds r0, r2, #0
	bl Proc_Break
	b _080132AC
_08013298:
	ldr r0, [r2, #0x58]
	adds r0, #1
	str r0, [r2, #0x58]
	movs r3, #0
	ldrsh r1, [r1, r3]
	cmp r0, r1
	bne _080132AC
	adds r0, r2, #0
	bl Proc_Break
_080132AC:
	pop {r0}
	bx r0

