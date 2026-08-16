	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085950
sub_08085950: @ 0x08085950
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	mov r8, r1
	bl sub_08026190
	adds r5, r0, #0
	ldr r6, _08085998 @ =0x06012000
	bl sub_080261A0
	adds r2, r0, #0
	ldr r1, _0808599C @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	lsls r2, r2, #5
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08011E54
	mov r0, r8
	bl sub_080261C8
	adds r4, #0x10
	lsls r4, r4, #0x15
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	movs r2, #0x20
	bl sub_08013618
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085998: .4byte 0x06012000
_0808599C: .4byte 0x000003FF

