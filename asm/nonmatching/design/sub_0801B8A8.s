	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B8A8
sub_0801B8A8: @ 0x0801B8A8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	b _0801B8C2
_0801B8B0:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0801B7C0
	adds r0, r4, #0
	bl sub_0808B6B0
	adds r4, r4, r0
	adds r4, #1
_0801B8C2:
	ldrb r0, [r4]
	cmp r0, #1
	bne _0801B8B0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

