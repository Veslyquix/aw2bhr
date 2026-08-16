	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080195F8
sub_080195F8: @ 0x080195F8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0803670C
	movs r1, #0x1e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08019624
	ldr r2, _08019620 @ =gUnknown_0808E5A8
	cmp r0, #1
	bne _0801964C
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0801964C
	movs r0, #0
	b _08019636
	.align 2, 0
_08019620: .4byte gUnknown_0808E5A8
_08019624:
	ldr r2, _08019648 @ =gUnknown_0808E5A8
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #0xc]
	movs r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0801964C
	movs r0, #1
_08019636:
	strh r0, [r4, #0x1e]
	adds r0, r4, #0
	bl sub_08019578
	movs r0, #0x67
	bl sub_0803B4DC
	b _0801967A
	.align 2, 0
_08019648: .4byte gUnknown_0808E5A8
_0801964C:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801967A
	ldr r1, _08019680 @ =gUnknown_03002EE4
	ldrh r0, [r4, #0x1e]
	strh r0, [r1]
	ldr r0, [r4, #0x28]
	bl sub_080179D0
	ldr r0, [r4, #0x2c]
	bl _call_via_r0
	ldr r0, _08019684 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	movs r0, #0x65
	bl sub_0803B4DC
_0801967A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019680: .4byte gUnknown_03002EE4
_08019684: .4byte gUnknown_03001FBC

