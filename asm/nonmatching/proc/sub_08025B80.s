	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025B80
sub_08025B80: @ 0x08025B80
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r4, #6]
	lsls r3, r2, #0x19
	lsrs r0, r3, #0x19
	cmp r0, r1
	blo _08025BA4
	subs r0, r0, r1
	movs r1, #0x7f
	ands r0, r1
	movs r1, #0x80
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #6]
	b _08025BAC
_08025BA4:
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r4, #6]
_08025BAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

