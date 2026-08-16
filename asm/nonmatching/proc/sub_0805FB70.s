	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805FB70
sub_0805FB70: @ 0x0805FB70
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r1, _0805FC04 @ =0xFFFF0000
	ldr r0, [sp, #4]
	ands r0, r1
	ldr r4, _0805FC08 @ =0x0000270F
	orrs r0, r4
	str r0, [sp, #4]
	ldr r5, _0805FC0C @ =gUnknown_030040D8
	ldr r0, [r5]
	bl sub_080202A4
	ldr r0, [r5]
	ldrb r0, [r0, #9]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	add r6, sp, #4
	adds r1, r6, #0
	bl sub_0805FC1C
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, r4
	beq _0805FBFA
	ldr r2, [r5]
	ldrb r1, [r2, #9]
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #9]
	ldr r3, _0805FC10 @ =gUnknown_08499594
	ldr r0, _0805FC14 @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r1, [r6, #2]
	lsls r1, r1, #1
	ldr r4, _0805FC18 @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r1, [r0]
	add r0, sp, #4
	ldrh r0, [r0]
	adds r1, r1, r0
	adds r2, #0x12
	adds r2, r2, r1
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, [r3]
	adds r2, r2, r0
	ldrb r3, [r2, #9]
	lsrs r1, r3, #6
	adds r1, #1
	lsls r1, r1, #6
	movs r0, #0x3f
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #9]
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	movs r2, #0
	str r2, [sp]
	movs r2, #7
	movs r3, #0
	bl sub_0805D648
_0805FBFA:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FC04: .4byte 0xFFFF0000
_0805FC08: .4byte 0x0000270F
_0805FC0C: .4byte gUnknown_030040D8
_0805FC10: .4byte gUnknown_08499594
_0805FC14: .4byte gUnknown_08499590
_0805FC18: .4byte 0x0000417A

