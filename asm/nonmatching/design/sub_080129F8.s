	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080129F8
sub_080129F8: @ 0x080129F8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_080129E0
	ldr r1, _08012A18 @ =0x00002710
	bl __umodsi3
	movs r1, #0x64
	muls r1, r4, r1
	cmp r0, r1
	blo _08012A1C
	movs r0, #0
	b _08012A1E
	.align 2, 0
_08012A18: .4byte 0x00002710
_08012A1C:
	movs r0, #1
_08012A1E:
	pop {r4}
	pop {r1}
	bx r1

