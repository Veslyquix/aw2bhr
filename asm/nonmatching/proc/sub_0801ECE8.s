	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801ECE8
sub_0801ECE8: @ 0x0801ECE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	str r3, [sp]
	ldr r5, [sp, #0x24]
	ldr r6, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	mov ip, r0
	ldr r3, _0801ED5C @ =gUnknown_0200ED20
	mov r8, r3
	ldr r7, _0801ED60 @ =gUnknown_03002510
	ldr r0, [r7]
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r4, r3
	movs r3, #0
	mov sl, r3
	strh r1, [r0]
	strh r2, [r0, #2]
	movs r1, #4
	add r8, r1
	add r4, r8
	ldr r3, [sp]
	str r3, [r4]
	mov r1, sl
	strh r1, [r0, #8]
	ldr r1, _0801ED64 @ =0xFFFFDFFF
	ands r1, r5
	ldr r2, _0801ED68 @ =0xFFFFEFFF
	adds r5, r1, #0
	ands r5, r2
	str r5, [r0, #0xc]
	str r6, [r0, #0x10]
	mov r3, ip
	strh r3, [r0, #0xa]
	mov r1, sb
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov sb, r1
	bl sub_0801A718
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0801ED6C
	ldr r0, [r7]
	adds r0, #1
	str r0, [r7]
	movs r0, #0
	b _0801ED6E
	.align 2, 0
_0801ED5C: .4byte gUnknown_0200ED20
_0801ED60: .4byte gUnknown_03002510
_0801ED64: .4byte 0xFFFFDFFF
_0801ED68: .4byte 0xFFFFEFFF
_0801ED6C:
	movs r0, #1
_0801ED6E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

