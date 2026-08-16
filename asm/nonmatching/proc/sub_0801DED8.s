	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DED8
sub_0801DED8: @ 0x0801DED8
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r0, _0801DF18 @ =gUnknown_0808F0AC
	ldr r1, [r0]
	ldr r1, [r1]
	adds r6, r0, #0
	cmp r4, r1
	bge _0801DF10
	ldr r5, _0801DF1C @ =gUnknown_0200E440
_0801DEEA:
	movs r0, #0x4c
	muls r0, r4, r0
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _0801DF06
	adds r0, r4, #0
	movs r1, #0
	bl sub_0801DCD4
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl sub_0801DB04
_0801DF06:
	adds r4, #1
	ldr r0, [r6]
	ldr r0, [r0]
	cmp r4, r0
	blt _0801DEEA
_0801DF10:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801DF18: .4byte gUnknown_0808F0AC
_0801DF1C: .4byte gUnknown_0200E440

