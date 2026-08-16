	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080176C0
sub_080176C0: @ 0x080176C0
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r1, _080176D8 @ =gUnknown_0808E558
	ldr r4, [r1]
	ldr r3, [r4]
	ldr r5, _080176DC @ =0x0000270F
	subs r0, r5, r3
	cmp r0, r2
	bhs _080176E0
	str r5, [r4]
	b _080176E4
	.align 2, 0
_080176D8: .4byte gUnknown_0808E558
_080176DC: .4byte 0x0000270F
_080176E0:
	adds r0, r3, r2
	str r0, [r4]
_080176E4:
	ldr r1, [r1]
	ldr r3, [r1, #4]
	ldr r4, _080176F4 @ =0x0000270F
	subs r0, r4, r3
	cmp r0, r2
	bhs _080176F8
	str r4, [r1, #4]
	b _080176FC
	.align 2, 0
_080176F4: .4byte 0x0000270F
_080176F8:
	adds r0, r3, r2
	str r0, [r1, #4]
_080176FC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

