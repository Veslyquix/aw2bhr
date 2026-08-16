	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BC3C
sub_0801BC3C: @ 0x0801BC3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	mov r8, r1
	mov ip, r2
	ldr r4, [r5]
	cmp r4, #1
	beq _0801BC92
	ldr r3, _0801BC9C @ =gUnknown_03002F2C
	ldr r1, [r3]
	ldr r7, _0801BCA0 @ =gUnknown_0808F08C
	ldr r0, [r7]
	cmp r1, r0
	bhs _0801BC92
	adds r6, r3, #0
_0801BC5C:
	movs r0, #6
	ldrsh r1, [r5, r0]
	add r1, r8
	ldr r0, _0801BCA4 @ =0x000001FF
	ands r1, r0
	movs r0, #8
	ldrsh r2, [r5, r0]
	add r2, ip
	movs r0, #0xff
	ands r2, r0
	ldr r3, [r6]
	lsls r1, r1, #0x10
	orrs r4, r1
	orrs r4, r2
	stm r3!, {r4}
	str r3, [r6]
	ldrh r0, [r5, #4]
	strh r0, [r3]
	adds r3, #4
	str r3, [r6]
	adds r5, #0xc
	ldr r4, [r5]
	cmp r4, #1
	beq _0801BC92
	ldr r0, [r7]
	cmp r3, r0
	blo _0801BC5C
_0801BC92:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801BC9C: .4byte gUnknown_03002F2C
_0801BCA0: .4byte gUnknown_0808F08C
_0801BCA4: .4byte 0x000001FF

