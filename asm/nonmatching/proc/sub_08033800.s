	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033800
sub_08033800: @ 0x08033800
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, [r6, #0x30]
	ldr r0, [r6, #0x38]
	cmp r1, r0
	beq _08033816
	subs r0, r0, r1
	asrs r0, r0, #1
	adds r0, r1, r0
	str r0, [r6, #0x30]
_08033816:
	ldr r4, _08033888 @ =gUnknown_0849B108
	ldr r2, [r6, #0x58]
	lsls r0, r2, #2
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r1, [r6, #0x2c]
	adds r1, r1, r0
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r3, #0
	ldrsh r0, [r2, r3]
	ldr r2, [r6, #0x30]
	adds r2, r2, r0
	adds r2, #0x10
	movs r5, #0
	str r5, [sp]
	movs r0, #0x50
	movs r3, #0
	bl sub_0801F34C
	ldr r2, [r6, #0x58]
	lsls r0, r2, #2
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r1, [r6, #0x2c]
	subs r1, r1, r0
	adds r1, #0x90
	movs r0, #0xc0
	lsls r0, r0, #6
	orrs r1, r0
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r3, #0
	ldrsh r0, [r2, r3]
	ldr r2, [r6, #0x30]
	subs r2, r2, r0
	subs r2, #0x10
	str r5, [sp]
	movs r0, #0x50
	movs r3, #0
	bl sub_0801F34C
	ldr r0, [r6, #0x58]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	str r0, [r6, #0x58]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033888: .4byte gUnknown_0849B108

