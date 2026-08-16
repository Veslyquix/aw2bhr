	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801D84C
sub_0801D84C: @ 0x0801D84C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r3, _0801D888 @ =gUnknown_0808F09C
	ldr r1, [r3]
	movs r7, #0x4c
	adds r0, r4, #0
	muls r0, r7, r0
	adds r6, r1, #0
	adds r6, #8
	adds r0, r0, r6
	movs r1, #0
	str r1, [r0]
	ldr r1, _0801D88C @ =gUnknown_0808F0A0
	ldr r5, [r1]
	adds r2, r4, #1
	ldr r0, [r5]
	mov ip, r1
	cmp r0, r2
	bne _0801D8AE
	subs r2, r4, #1
	cmp r2, #0
	blt _0801D8AE
	adds r0, r2, #0
	muls r0, r7, r0
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _0801D890
	str r4, [r5]
	b _0801D8AE
	.align 2, 0
_0801D888: .4byte gUnknown_0808F09C
_0801D88C: .4byte gUnknown_0808F0A0
_0801D890:
	subs r2, #1
	cmp r2, #0
	blt _0801D8AE
	ldr r1, [r3]
	movs r0, #0x4c
	muls r0, r2, r0
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0801D890
	mov r0, ip
	ldr r1, [r0]
	adds r0, r2, #1
	str r0, [r1]
_0801D8AE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

