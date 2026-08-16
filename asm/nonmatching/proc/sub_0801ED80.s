	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801ED80
sub_0801ED80: @ 0x0801ED80
	sub sp, #4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	str r3, [sp, #0x20]
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	ldr r0, [sp, #0x28]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r1, [sp]
	str r2, [sp, #4]
	movs r7, #1
	rsbs r7, r7, #0
	str r7, [sp, #8]
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_0801ECE8
	cmp r0, #0
	bne _0801EDB4
	movs r0, #0
	b _0801EDB6
_0801EDB4:
	adds r0, r7, #0
_0801EDB6:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #4
	bx r3

