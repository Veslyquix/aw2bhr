	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B8D0
sub_0801B8D0: @ 0x0801B8D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	ldr r4, _0801B958 @ =gUnknown_0808EF84
	ldr r0, [r4]
	movs r1, #0
	str r1, [r0]
	ldr r3, _0801B95C @ =gUnknown_0808EF88
	ldr r0, [r3]
	str r1, [r0]
	ldr r2, _0801B960 @ =gUnknown_0808EF8C
	ldr r0, [r2]
	str r1, [r0]
	ldrb r0, [r6]
	mov sb, r4
	mov r8, r3
	adds r4, r2, #0
	cmp r0, #0
	beq _0801B93E
_0801B8FE:
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	beq _0801B914
	movs r0, #1
	bl sub_0801B964
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801B914
	adds r5, #0x40
_0801B914:
	ldrb r0, [r6]
	adds r6, #1
	mov r2, r8
	ldr r1, [r2]
	ldr r2, [r1]
	adds r1, r5, #0
	adds r3, r7, #0
	bl sub_0801B738
	mov r2, sb
	ldr r1, [r2]
	str r0, [r1]
	bl sub_0801B964
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801B938
	adds r5, #0x40
_0801B938:
	ldrb r0, [r6]
	cmp r0, #0
	bne _0801B8FE
_0801B93E:
	ldr r0, [r4]
	ldr r0, [r0]
	adds r0, #7
	movs r1, #8
	bl Div
	lsls r0, r0, #1
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801B958: .4byte gUnknown_0808EF84
_0801B95C: .4byte gUnknown_0808EF88
_0801B960: .4byte gUnknown_0808EF8C

