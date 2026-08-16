	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806096C
sub_0806096C: @ 0x0806096C
	push {lr}
	movs r0, #4
	bl sub_08060ED4
	cmp r0, #0
	beq _080609AC
	movs r0, #0x14
	bl sub_08057FA8
	adds r2, r0, #0
	ldr r1, _0806098C @ =gUnknown_030046D4
	ldr r0, [r1]
	cmp r0, #0
	bne _08060990
	movs r1, #0x64
	b _0806099C
	.align 2, 0
_0806098C: .4byte gUnknown_030046D4
_08060990:
	movs r0, #0x64
	muls r0, r2, r0
	ldr r1, [r1]
	bl __divsi3
	adds r1, r0, #0
_0806099C:
	ldr r0, _080609B0 @ =gUnknown_085766E0
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bge _080609AC
	ldr r1, _080609B4 @ =gUnknown_030046C0
	movs r0, #0x14
	strb r0, [r1, #6]
_080609AC:
	pop {r0}
	bx r0
	.align 2, 0
_080609B0: .4byte gUnknown_085766E0
_080609B4: .4byte gUnknown_030046C0

