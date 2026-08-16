	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801D81C
sub_0801D81C: @ 0x0801D81C
	push {lr}
	adds r3, r0, #0
	ldr r1, _0801D83C @ =gUnknown_0200E438
	movs r0, #0x4c
	muls r0, r3, r0
	adds r2, r0, r1
	movs r0, #0x38
	ldrsh r1, [r2, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0801D840
	adds r0, r1, #0
	bl sub_08015328
	b _0801D846
	.align 2, 0
_0801D83C: .4byte gUnknown_0200E438
_0801D840:
	adds r0, r3, #0
	bl sub_0801D84C
_0801D846:
	pop {r0}
	bx r0
	.align 2, 0

