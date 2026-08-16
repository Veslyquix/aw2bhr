	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080293C8
sub_080293C8: @ 0x080293C8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_08023824
	bl sub_080236E8
	movs r0, #4
	bl sub_08023908
	adds r0, r4, #0
	bl sub_08029490
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08029444
	movs r0, #2
	bl sub_08023274
	ldr r2, _0802942C @ =gUnknown_08090B68
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802944C
	adds r0, r4, #0
	bl Proc_End
	ldr r4, _08029430 @ =gUnknown_03003F40
	ldr r0, _08029434 @ =gUnknown_08499590
	ldr r2, [r0]
	ldr r3, _08029438 @ =gUnknown_030033E4
	ldrh r1, [r3, #2]
	lsls r1, r1, #1
	ldr r5, _0802943C @ =0x0000417A
	adds r0, r2, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r3]
	adds r0, r0, r1
	ldr r1, _08029440 @ =0x0000051A
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r0, [r2]
	str r0, [r4]
	bl sub_08028EE4
	b _08029478
	.align 2, 0
_0802942C: .4byte gUnknown_08090B68
_08029430: .4byte gUnknown_03003F40
_08029434: .4byte gUnknown_08499590
_08029438: .4byte gUnknown_030033E4
_0802943C: .4byte 0x0000417A
_08029440: .4byte 0x0000051A
_08029444:
	movs r0, #1
	bl sub_08023274
	ldr r2, _08029480 @ =gUnknown_08090B68
_0802944C:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08029478
	ldr r2, _08029484 @ =gUnknown_030033E4
	ldr r1, _08029488 @ =gUnknown_03003100
	ldrh r0, [r1]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	ldr r1, _0802948C @ =gUnknown_03003F40
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_End
	bl sub_08028EE4
_08029478:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029480: .4byte gUnknown_08090B68
_08029484: .4byte gUnknown_030033E4
_08029488: .4byte gUnknown_03003100
_0802948C: .4byte gUnknown_03003F40

