	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807B7BC
sub_0807B7BC: @ 0x0807B7BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	mov sl, r1
	mov r8, r2
	movs r2, #0
	mov sb, r2
	ldrb r0, [r4]
	cmp r0, #0
	beq _0807B838
	adds r7, r3, #0
_0807B7DA:
	ldr r5, _0807B7E4 @ =gUnknown_08616194
	ldrb r0, [r5]
	adds r6, r4, #1
	b _0807B82C
	.align 2, 0
_0807B7E4: .4byte gUnknown_08616194
_0807B7E8:
	ldrb r0, [r4]
	ldrb r1, [r5]
	cmp r0, r1
	bne _0807B828
	ldr r0, [r5, #4]
	ldr r1, _0807B820 @ =0x000003FF
	ands r1, r7
	lsls r1, r1, #5
	ldr r3, _0807B824 @ =0x06010000
	adds r1, r1, r3
	str r2, [sp]
	bl sub_08011CAC
	ldr r1, [r5, #8]
	mov r3, sb
	adds r0, r3, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r2, [sp]
	mov r0, r8
	cmp r0, #0
	beq _0807B81A
	adds r0, r2, r0
	strb r1, [r0, #1]
_0807B81A:
	adds r7, #8
	adds r2, #1
	b _0807B830
	.align 2, 0
_0807B820: .4byte 0x000003FF
_0807B824: .4byte 0x06010000
_0807B828:
	adds r5, #0xc
	ldrb r0, [r5]
_0807B82C:
	cmp r0, #0
	bne _0807B7E8
_0807B830:
	adds r4, r6, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0807B7DA
_0807B838:
	mov r1, sl
	cmp r1, #0
	beq _0807B842
	mov r3, sb
	strh r3, [r1]
_0807B842:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

