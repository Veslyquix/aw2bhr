	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016C9C
sub_08016C9C: @ 0x08016C9C
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #3
	beq _08016CC0
	cmp r1, #3
	bgt _08016CB0
	cmp r1, #2
	beq _08016CB6
	b _08016CD0
_08016CB0:
	cmp r1, #4
	beq _08016CCC
	b _08016CD0
_08016CB6:
	ldr r0, _08016CBC @ =gUnknown_0808E540
	ldr r0, [r0]
	b _08016CD0
	.align 2, 0
_08016CBC: .4byte gUnknown_0808E540
_08016CC0:
	ldr r0, _08016CC8 @ =gUnknown_0808E544
	ldr r0, [r0]
	b _08016CD0
	.align 2, 0
_08016CC8: .4byte gUnknown_0808E544
_08016CCC:
	ldr r0, _08016CD4 @ =gUnknown_0808E548
	ldr r0, [r0]
_08016CD0:
	bx lr
	.align 2, 0
_08016CD4: .4byte gUnknown_0808E548

