	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011B98
sub_08011B98: @ 0x08011B98
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _08011BC0 @ =gUnknown_03000000
_08011B9E:
	lsls r0, r4, #2
	adds r1, r0, r5
	ldr r0, [r1]
	cmp r0, #0
	beq _08011BAE
	ldr r0, [r1]
	bl _call_via_r0
_08011BAE:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xf
	bls _08011B9E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011BC0: .4byte gUnknown_03000000

