	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024ED8
sub_08024ED8: @ 0x08024ED8
	push {r4, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	movs r1, #8
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bgt _08024F0E
	movs r4, #8
	ldrsh r1, [r3, r4]
	cmp r1, #0
	bgt _08024F06
	cmp r0, r1
	bge _08024EFC
	movs r1, #0
	movs r0, #1
	strh r0, [r3, #8]
	strh r1, [r2, #8]
	b _08024F1A
_08024EFC:
	movs r1, #0
	movs r0, #1
	strh r0, [r2, #8]
	strh r1, [r3, #8]
	b _08024F1A
_08024F06:
	cmp r0, #0
	bge _08024F0E
	movs r0, #0
	strh r0, [r2, #8]
_08024F0E:
	movs r1, #8
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _08024F1A
	movs r0, #0
	strh r0, [r3, #8]
_08024F1A:
	pop {r4}
	pop {r0}
	bx r0

