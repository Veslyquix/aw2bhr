	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801D8E4
sub_0801D8E4: @ 0x0801D8E4
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r0, _0801D91C @ =gUnknown_0808F0A4
	ldr r1, [r0]
	ldr r1, [r1]
	adds r6, r0, #0
	cmp r4, r1
	bge _0801D914
	ldr r5, _0801D920 @ =gUnknown_0200E440
_0801D8F6:
	movs r0, #0x4c
	muls r0, r4, r0
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _0801D90A
	adds r0, r4, #0
	movs r1, #1
	bl sub_0801D390
_0801D90A:
	adds r4, #1
	ldr r0, [r6]
	ldr r0, [r0]
	cmp r4, r0
	blt _0801D8F6
_0801D914:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801D91C: .4byte gUnknown_0808F0A4
_0801D920: .4byte gUnknown_0200E440

