	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011A20
sub_08011A20: @ 0x08011A20
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
_08011A2C:
	adds r0, r4, #0
	movs r1, #0xa
	bl __umodsi3
	adds r2, r0, #0
	movs r0, #0xf4
	lsls r0, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08011704
	adds r0, r5, #0
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl __udivsi3
	adds r4, r0, #0
	cmp r4, #0
	bne _08011A2C
	pop {r4, r5, r6}
	pop {r0}
	bx r0

