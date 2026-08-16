	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08023D7C
sub_08023D7C: @ 0x08023D7C
	push {r4, r5, r6, lr}
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	movs r4, #0
_08023D88:
	adds r0, r6, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	bl sub_080227F4
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xf
	bls _08023D88
	pop {r4, r5, r6}
	pop {r0}
	bx r0

