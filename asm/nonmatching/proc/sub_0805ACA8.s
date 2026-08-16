	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805ACA8
sub_0805ACA8: @ 0x0805ACA8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _0805ACEC @ =0x0000270F
	mov r8, r0
	mov r0, r8
	strh r0, [r5]
	subs r0, r6, #1
	bl sub_0805ACFC
	adds r0, r6, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_0805ACFC
	subs r1, r4, #1
	adds r0, r6, #0
	adds r2, r5, #0
	bl sub_0805ACFC
	adds r4, #1
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_0805ACFC
	ldrh r0, [r5]
	cmp r0, r8
	beq _0805ACF0
	movs r0, #1
	b _0805ACF2
	.align 2, 0
_0805ACEC: .4byte 0x0000270F
_0805ACF0:
	movs r0, #0
_0805ACF2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

