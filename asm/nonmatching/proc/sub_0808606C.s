	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808606C
sub_0808606C: @ 0x0808606C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _080860D4
	cmp r0, #1
	bne _080860B8
	adds r0, r4, #0
	adds r0, #0x4e
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _0808609C
	ldr r0, [r4, #0x5c]
	ldr r1, _08086098 @ =gUnknown_03005928
	ldr r1, [r1]
	adds r1, #1
	movs r2, #1
	rsbs r2, r2, #0
	bl sub_08086A58
	b _080860AE
	.align 2, 0
_08086098: .4byte gUnknown_03005928
_0808609C:
	ldr r0, [r4, #0x5c]
	subs r0, #1
	ldr r1, _080860B4 @ =gUnknown_03005928
	ldr r1, [r1]
	adds r1, #1
	movs r2, #1
	rsbs r2, r2, #0
	bl sub_08086A58
_080860AE:
	ldr r0, [r4, #0x30]
	b _080860D0
	.align 2, 0
_080860B4: .4byte gUnknown_03005928
_080860B8:
	cmp r0, #3
	bne _080860D0
	ldr r0, [r4, #0x5c]
	ldr r1, _080860CC @ =gUnknown_03005928
	ldr r1, [r1]
	movs r2, #0
	bl sub_08086A58
	movs r0, #0
	b _080860D2
	.align 2, 0
_080860CC: .4byte gUnknown_03005928
_080860D0:
	adds r0, #1
_080860D2:
	str r0, [r4, #0x30]
_080860D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

