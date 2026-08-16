	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E4B0
sub_0801E4B0: @ 0x0801E4B0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r5, _0801E4F8 @ =gUnknown_0200ED20
	ldr r7, _0801E4FC @ =gUnknown_03002510
	ldr r0, [r7]
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r4, r5
	strh r1, [r0]
	strh r2, [r0, #2]
	adds r5, #4
	adds r4, r4, r5
	movs r1, #0x80
	lsls r1, r1, #0x17
	orrs r1, r3
	str r1, [r4]
	mov r1, sp
	ldrh r1, [r1, #0x14]
	strh r1, [r0, #8]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	adds r1, r6, #0
	bl sub_0801A718
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0801E500
	ldr r0, [r7]
	adds r0, #1
	str r0, [r7]
	movs r0, #0
	b _0801E502
	.align 2, 0
_0801E4F8: .4byte gUnknown_0200ED20
_0801E4FC: .4byte gUnknown_03002510
_0801E500:
	movs r0, #1
_0801E502:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

