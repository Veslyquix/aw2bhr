	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080088F0
sub_080088F0: @ 0x080088F0
	push {r4, lr}
	movs r0, #1
	bl sub_08025308
	ldr r4, _08008924 @ =gUnknown_0200B0B0
	ldr r1, [r4]
	strb r0, [r1, #0x13]
	movs r0, #2
	bl sub_08025308
	ldr r1, [r4]
	strb r0, [r1, #0x14]
	movs r0, #3
	bl sub_08025308
	ldr r1, [r4]
	strb r0, [r1, #0x15]
	movs r0, #4
	bl sub_08025308
	ldr r1, [r4]
	strb r0, [r1, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008924: .4byte gUnknown_0200B0B0

