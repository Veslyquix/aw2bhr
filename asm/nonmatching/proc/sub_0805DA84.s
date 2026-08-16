	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805DA84
sub_0805DA84: @ 0x0805DA84
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _0805DAFC @ =gUnknown_030040D8
	ldr r0, [r0]
	bl sub_080202A4
	movs r0, #0x79
	bl sub_0801FD9C
	add r0, sp, #4
	bl sub_0805A5E0
	ldr r2, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0805DAF4
	ldr r1, _0805DB00 @ =0xFFFF0000
	ldr r0, [sp, #8]
	ands r0, r1
	ldr r4, _0805DB04 @ =0x0000270F
	orrs r0, r4
	str r0, [sp, #8]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	add r5, sp, #8
	adds r1, r5, #0
	bl sub_08058BB4
	ldrh r0, [r5]
	cmp r0, r4
	beq _0805DAF4
	ldr r2, _0805DB08 @ =gUnknown_08499594
	ldr r1, [sp, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r1, r1, r0
	ldrb r2, [r1, #9]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #9]
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r3, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r2, #0
	str r2, [sp]
	movs r2, #6
	bl sub_0805D648
_0805DAF4:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DAFC: .4byte gUnknown_030040D8
_0805DB00: .4byte 0xFFFF0000
_0805DB04: .4byte 0x0000270F
_0805DB08: .4byte gUnknown_08499594

