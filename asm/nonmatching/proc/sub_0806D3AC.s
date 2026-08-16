	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D3AC
sub_0806D3AC: @ 0x0806D3AC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r1, #0x28
	ldrsh r0, [r6, r1]
	adds r0, #0x20
	movs r2, #0x2a
	ldrsh r1, [r6, r2]
	ldrh r2, [r6, #0x1c]
	bl sub_08064DDC
	movs r7, #0x28
	ldrsh r0, [r6, r7]
	adds r0, #0x20
	movs r2, #0x2a
	ldrsh r1, [r6, r2]
	adds r1, #0x10
	ldrh r2, [r6, #0x1c]
	bl sub_08064E1C
	movs r7, #0x28
	ldrsh r0, [r6, r7]
	adds r0, #0x18
	ldr r4, _0806D450 @ =0x000001FF
	ands r0, r4
	movs r2, #0x2a
	ldrsh r1, [r6, r2]
	adds r1, #0x30
	movs r5, #0xff
	ands r1, r5
	adds r2, r6, #0
	adds r2, #0x44
	ldrh r3, [r2]
	movs r7, #0xc0
	lsls r7, r7, #4
	adds r2, r7, #0
	orrs r2, r3
	movs r3, #2
	bl sub_08043FD8
	movs r0, #0x28
	ldrsh r1, [r6, r0]
	subs r1, #8
	ands r1, r4
	movs r7, #0x2a
	ldrsh r2, [r6, r7]
	subs r2, #8
	ands r2, r5
	movs r0, #1
	str r0, [sp]
	movs r0, #0xbc
	movs r3, #0
	bl sub_0801F34C
	movs r0, #0x2a
	ldrsh r2, [r6, r0]
	ldr r0, _0806D454 @ =gUnknown_08580934
	ldr r0, [r0]
	adds r0, #0x11
	ldrh r1, [r6, #0x1c]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, #0xbd
	ldrh r1, [r6, #0x28]
	ands r4, r1
	adds r2, #0x34
	ands r2, r5
	movs r1, #0
	str r1, [sp]
	adds r1, r4, #0
	movs r3, #0
	bl sub_0801F34C
	adds r0, r6, #0
	adds r0, #0x48
	ldrb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D450: .4byte 0x000001FF
_0806D454: .4byte gUnknown_08580934

