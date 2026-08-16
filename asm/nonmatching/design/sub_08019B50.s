	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019B50
sub_08019B50: @ 0x08019B50
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r0, #0x42
	ldrb r5, [r0]
	subs r0, #0x11
	adds r0, r0, r5
	ldrb r3, [r0]
	ldr r1, [r2, #0x20]
	lsls r0, r3, #5
	adds r0, r0, r1
	ldr r4, [r0, #0xc]
	cmp r4, #0
	beq _08019B7A
	adds r0, r2, #0
	adds r0, #0x24
	adds r0, r0, r3
	ldrb r2, [r0]
	adds r0, r3, #0
	adds r1, r5, #0
	bl _call_via_r4
_08019B7A:
	pop {r4, r5}
	pop {r0}
	bx r0

