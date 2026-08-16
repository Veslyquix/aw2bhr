	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067830
sub_08067830: @ 0x08067830
	push {lr}
	sub sp, #0x14
	adds r2, r0, #0
	ldr r0, [r2, #0x60]
	cmp r0, #0
	beq _0806788E
	ldr r0, [r2, #0x5c]
	ldr r1, [r2, #0x3c]
	adds r0, r0, r1
	str r0, [r2, #0x5c]
	cmp r0, #0
	bge _0806784A
	adds r0, #3
_0806784A:
	asrs r1, r0, #2
	ldr r0, [r2, #0x58]
	adds r3, r0, r1
	str r3, [r2, #0x58]
	movs r0, #0xf0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp, #4]
	add r1, sp, #8
	movs r0, #0x78
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x50
	strh r0, [r1]
	adds r0, r3, #0
	cmp r3, #0
	bge _08067872
	adds r0, r3, #3
_08067872:
	asrs r1, r0, #2
	add r0, sp, #0xc
	strh r1, [r0]
	mov r0, sp
	adds r0, #0xe
	strh r1, [r0]
	add r1, sp, #0x10
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08067894 @ =gUnknown_030024D0
	mov r0, sp
	movs r2, #1
	bl BgAffineSet
_0806788E:
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_08067894: .4byte gUnknown_030024D0

