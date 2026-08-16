	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801AFF4
sub_0801AFF4: @ 0x0801AFF4
	push {r4, lr}
	ldr r4, _0801B008 @ =gUnknown_0200CD0C
	bl sub_0808AB8C
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801B00C
	movs r0, #1
	b _0801B00E
	.align 2, 0
_0801B008: .4byte gUnknown_0200CD0C
_0801B00C:
	movs r0, #0
_0801B00E:
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

