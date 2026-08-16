	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012FB8
sub_08012FB8: @ 0x08012FB8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r0, _08012FE4 @ =gUnknown_08489354
	movs r1, #0
	bl sub_080152EC
	adds r4, r0, #0
	bl _call_via_r5
	str r6, [r4, #0x20]
	mov r0, r8
	str r0, [r4, #0x24]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08012FE4: .4byte gUnknown_08489354

