	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037638
sub_08037638: @ 0x08037638
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	mov r8, r3
	ldr r0, _08037670 @ =sub_08037790
	bl sub_08011B34
	ldr r0, _08037674 @ =0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	adds r0, r4, r0
	bl sub_08037610
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	mov r3, r8
	bl sub_0803768C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037670: .4byte sub_08037790
_08037674: .4byte 0x000003FF

