	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805A854
sub_0805A854: @ 0x0805A854
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805A8AC @ =0xFFFF0000
	ldr r0, [sp]
	ands r0, r1
	ldr r4, _0805A8B0 @ =0x0000270F
	orrs r0, r4
	str r0, [sp]
	ldrh r0, [r5]
	subs r0, #1
	ldrh r1, [r5, #2]
	mov r6, sp
	mov r2, sp
	bl sub_0805C128
	ldrh r0, [r5]
	adds r0, #1
	ldrh r1, [r5, #2]
	mov r2, sp
	bl sub_0805C128
	ldrh r0, [r5]
	ldrh r1, [r5, #2]
	subs r1, #1
	mov r2, sp
	bl sub_0805C128
	ldrh r0, [r5]
	ldrh r1, [r5, #2]
	adds r1, #1
	mov r2, sp
	bl sub_0805C128
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, r4
	beq _0805A8B4
	strh r0, [r5]
	ldrh r0, [r6, #2]
	strh r0, [r5, #2]
	movs r0, #1
	b _0805A8B6
	.align 2, 0
_0805A8AC: .4byte 0xFFFF0000
_0805A8B0: .4byte 0x0000270F
_0805A8B4:
	movs r0, #0
_0805A8B6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

