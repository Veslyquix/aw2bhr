	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805BDE4
sub_0805BDE4: @ 0x0805BDE4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	bl sub_0805B4A8
	add r2, sp, #4
	mov r1, sp
	bl sub_0805B4D8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805BE06
	strh r5, [r4]
	strh r6, [r4, #2]
_0805BE06:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

