	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003890
sub_08003890: @ 0x08003890
	push {lr}
	sub sp, #4
	ldr r2, _080038B8 @ =gUnknown_0808D784
	ldr r0, [r2]
	ldr r3, [r0]
	ldrh r1, [r3]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080038BC
	adds r1, r3, #0
	adds r1, #0x42
	movs r0, #0
	ldrsh r3, [r1, r0]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r3, r0
	bge _080038CE
	adds r0, r3, #1
	b _080038CE
	.align 2, 0
_080038B8: .4byte gUnknown_0808D784
_080038BC:
	adds r1, r3, #0
	adds r1, #0x42
	movs r0, #0
	ldrsh r3, [r1, r0]
	movs r0, #0xa
	rsbs r0, r0, #0
	cmp r3, r0
	blt _080038CE
	subs r0, r3, #1
_080038CE:
	adds r3, r0, #0
	strh r3, [r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r3, r0
	ble _08003906
	ldr r0, [r2]
	ldr r2, [r0]
	movs r1, #0x3e
	ldrsh r0, [r2, r1]
	movs r1, #0xd0
	cmp r0, #0
	bne _080038EA
	movs r1, #0x20
_080038EA:
	subs r1, #0x20
	ldr r0, _0800390C @ =0x000001FF
	ands r1, r0
	adds r0, r2, #0
	adds r0, #0x42
	ldrb r2, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x8e
	movs r3, #0
	bl sub_0801F34C
	bl sub_08003814
_08003906:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0800390C: .4byte 0x000001FF

