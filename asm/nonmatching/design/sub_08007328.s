	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08007328
sub_08007328: @ 0x08007328
	push {r4, lr}
	ldr r0, _08007350 @ =gUnknown_0200B0B0
	ldr r2, [r0]
	movs r0, #7
	ldrsb r0, [r2, r0]
	movs r3, #8
	cmp r0, #0
	bne _0800733A
	movs r3, #0xa
_0800733A:
	subs r1, r3, #1
	movs r4, #0x3a
	ldrsh r0, [r2, r4]
	adds r0, r0, r1
	cmp r0, r3
	blt _08007348
	subs r0, r0, r3
_08007348:
	strh r0, [r2, #0x3c]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08007350: .4byte gUnknown_0200B0B0

