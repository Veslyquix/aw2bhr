	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013008
sub_08013008: @ 0x08013008
	push {lr}
	adds r2, r0, #0
	ldr r1, _08013024 @ =gUnknown_03002F1C
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801301E
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r2, #0x24]
	bl _call_via_r0
_0801301E:
	pop {r0}
	bx r0
	.align 2, 0
_08013024: .4byte gUnknown_03002F1C

