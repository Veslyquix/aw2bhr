	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08023D14
sub_08023D14: @ 0x08023D14
	push {r4, r5, r6, r7, lr}
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	movs r5, #0
_08023D20:
	adds r4, r7, r5
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08022428
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08022618
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _08023D20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

