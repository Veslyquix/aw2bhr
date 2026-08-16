	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060474
sub_08060474: @ 0x08060474
	push {r4, lr}
	sub sp, #4
	bl sub_080424FC
	ldr r3, _0806049C @ =gUnknown_030046C0
	ldrb r0, [r3, #2]
	ldrb r1, [r3, #3]
	ldrb r2, [r3, #6]
	ldrb r3, [r3, #7]
	movs r4, #3
	str r4, [sp]
	bl sub_08042C24
	ldr r1, _080604A0 @ =gUnknown_030045D4
	movs r0, #6
	strh r0, [r1]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806049C: .4byte gUnknown_030046C0
_080604A0: .4byte gUnknown_030045D4

