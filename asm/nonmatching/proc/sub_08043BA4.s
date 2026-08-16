	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043BA4
sub_08043BA4: @ 0x08043BA4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	bl sub_08043BC8
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08043BF8
	adds r5, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08043AA0
	pop {r4, r5, r6}
	pop {r0}
	bx r0

