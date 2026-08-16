	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080051EC
sub_080051EC: @ 0x080051EC
	adds r1, r0, #0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08005208
	ldr r2, _08005200 @ =gUnknown_0808D7B4
	adds r1, r0, #0
_080051F8:
	cmp r0, r2
	beq _08005204
	movs r0, #1
	b _0800520A
	.align 2, 0
_08005200: .4byte gUnknown_0808D7B4
_08005204:
	cmp r1, #0
	bne _080051F8
_08005208:
	movs r0, #0
_0800520A:
	bx lr

