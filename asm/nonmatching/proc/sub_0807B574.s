	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807B574
sub_0807B574: @ 0x0807B574
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	movs r1, #3
	bl Div
	movs r1, #0x10
	bl DivRem
	lsls r0, r0, #1
	ldr r1, _0807B608 @ =gUnknown_0822AC60
	adds r0, r0, r1
	movs r1, #0x8e
	lsls r1, r1, #2
	movs r2, #2
	bl sub_08013618
	ldr r0, [r5, #0x38]
	adds r0, #1
	str r0, [r5, #0x38]
	ldr r2, [r5, #0x58]
	movs r0, #0x5b
	movs r1, #0x54
	movs r3, #0
	bl sub_0807B51C
	ldr r2, [r5, #0x5c]
	movs r0, #0x5b
	movs r1, #0x67
	movs r3, #1
	bl sub_0807B51C
	ldr r3, _0807B60C @ =gUnknown_0848B690
	ldr r0, _0807B610 @ =0x00001058
	str r0, [sp]
	movs r0, #0
	movs r1, #0x14
	movs r2, #0x54
	bl sub_0801BEBC
	ldr r4, _0807B614 @ =gUnknown_081D9324
	ldr r3, [r4]
	ldr r0, _0807B618 @ =0x0000105C
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa
	movs r2, #0x67
	bl sub_0801BEBC
	adds r7, r4, #0
	movs r6, #0x54
	movs r4, #1
_0807B5DE:
	ldr r0, _0807B61C @ =0x00001050
	str r0, [sp]
	movs r0, #0
	movs r1, #0x6c
	adds r2, r6, #0
	ldr r3, [r7]
	bl sub_0801BEBC
	adds r6, #0x13
	subs r4, #1
	cmp r4, #0
	bge _0807B5DE
	adds r0, r5, #0
	bl sub_0807B738
	ldr r0, [r5, #0x60]
	cmp r0, #0
	beq _0807B620
	subs r0, #1
	str r0, [r5, #0x60]
	b _0807B680
	.align 2, 0
_0807B608: .4byte gUnknown_0822AC60
_0807B60C: .4byte gUnknown_0848B690
_0807B610: .4byte 0x00001058
_0807B614: .4byte gUnknown_081D9324
_0807B618: .4byte 0x0000105C
_0807B61C: .4byte 0x00001050
_0807B620:
	ldr r2, [r5, #0x58]
	cmp r2, #0
	beq _0807B63E
	subs r1, r2, #1
	str r1, [r5, #0x58]
	ldr r0, [r5, #0x5c]
	adds r3, r0, #1
	str r3, [r5, #0x5c]
	cmp r1, #0
	beq _0807B644
	subs r0, r2, #2
	str r0, [r5, #0x58]
	adds r0, r3, #1
	str r0, [r5, #0x5c]
	b _0807B644
_0807B63E:
	adds r0, r5, #0
	bl Proc_Break
_0807B644:
	ldr r0, _0807B688 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0807B666
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x58]
	adds r0, r0, r1
	str r0, [r5, #0x5c]
	movs r0, #0
	str r0, [r5, #0x58]
	adds r0, r5, #0
	bl Proc_Break
_0807B666:
	ldr r1, [r5, #0x5c]
	ldr r0, _0807B68C @ =0x0000270E
	cmp r1, r0
	ble _0807B672
	adds r0, #1
	str r0, [r5, #0x5c]
_0807B672:
	ldr r0, [r5, #0x38]
	ands r0, r4
	cmp r0, #0
	beq _0807B680
	movs r0, #0x7c
	bl sub_0803B4DC
_0807B680:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B688: .4byte gUnknown_03002EE0
_0807B68C: .4byte 0x0000270E

