	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DF20
sub_0801DF20: @ 0x0801DF20
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r0, _0801DF58 @ =gUnknown_0808F0B0
	ldr r1, [r0]
	ldr r1, [r1]
	adds r6, r0, #0
	cmp r4, r1
	bge _0801DF50
	ldr r5, _0801DF5C @ =gUnknown_0200E440
_0801DF32:
	movs r0, #0x4c
	muls r0, r4, r0
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _0801DF46
	adds r0, r4, #0
	movs r1, #1
	bl sub_0801DCD4
_0801DF46:
	adds r4, #1
	ldr r0, [r6]
	ldr r0, [r0]
	cmp r4, r0
	blt _0801DF32
_0801DF50:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801DF58: .4byte gUnknown_0808F0B0
_0801DF5C: .4byte gUnknown_0200E440

