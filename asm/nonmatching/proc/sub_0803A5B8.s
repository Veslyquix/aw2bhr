	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803A5B8
sub_0803A5B8: @ 0x0803A5B8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _0803A5EC @ =gUnknown_0849E318
	ldr r3, _0803A5F0 @ =gUnknown_08090F74
	ldr r0, [r3]
	ldr r5, [r0]
	movs r4, #9
	ldrsb r4, [r5, r4]
	lsls r1, r4, #2
	adds r2, r1, r2
	ldrb r7, [r2]
	ldrb r2, [r2, #2]
	mov r8, r2
	ldr r0, _0803A5F4 @ =gUnknown_0849E358
	adds r1, r1, r0
	ldrb r2, [r1]
	ldrb r6, [r1, #2]
	mov sb, r3
	cmp r4, #4
	beq _0803A5F8
	cmp r4, #0xb
	beq _0803A614
	b _0803A632
	.align 2, 0
_0803A5EC: .4byte gUnknown_0849E318
_0803A5F0: .4byte gUnknown_08090F74
_0803A5F4: .4byte gUnknown_0849E358
_0803A5F8:
	ldr r3, _0803A60C @ =gUnknown_08610A38
	ldr r2, _0803A610 @ =gUnknown_085D5ABC
	ldr r0, [r5, #4]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	b _0803A624
	.align 2, 0
_0803A60C: .4byte gUnknown_08610A38
_0803A610: .4byte gUnknown_085D5ABC
_0803A614:
	ldr r3, _0803A654 @ =gUnknown_08610A38
	ldr r2, _0803A658 @ =gUnknown_085D5ABC
	ldr r0, [r5, #4]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0, #4]
_0803A624:
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	bl sub_08014CEC
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0803A632:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0]
	adds r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	adds r3, r6, #0
	bl sub_08022AF8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A654: .4byte gUnknown_08610A38
_0803A658: .4byte gUnknown_085D5ABC

