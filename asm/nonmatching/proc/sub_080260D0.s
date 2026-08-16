	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080260D0
sub_080260D0: @ 0x080260D0
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r2, _080260FC @ =gUnknown_08499594
	subs r1, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r2]
	adds r2, r1, r0
	movs r4, #0x3f
_080260E4:
	adds r1, r2, #0
	adds r0, r3, #0
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	adds r3, #0xc
	adds r2, #0xc
	subs r4, #1
	cmp r4, #0
	bge _080260E4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080260FC: .4byte gUnknown_08499594

