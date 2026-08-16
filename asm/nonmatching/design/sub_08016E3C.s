	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016E3C
sub_08016E3C: @ 0x08016E3C
	push {r4, lr}
	ldr r4, _08016E58 @ =gUnknown_02000000
	movs r0, #0
	adds r1, r4, #0
	bl sub_0801AC58
	cmp r0, #0
	bne _08016E52
	adds r0, r4, #0
	bl sub_08016BC0
_08016E52:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08016E58: .4byte gUnknown_02000000

