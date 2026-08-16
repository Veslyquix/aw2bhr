	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019560
sub_08019560: @ 0x08019560
	push {lr}
	ldr r0, _08019574 @ =gUnknown_03002514
	ldrb r0, [r0]
	cmp r0, #1
	bne _0801956E
	bl sub_08014878
_0801956E:
	pop {r0}
	bx r0
	.align 2, 0
_08019574: .4byte gUnknown_03002514

