	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805F7B8
sub_0805F7B8: @ 0x0805F7B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	ldr r4, _0805F874 @ =gUnknown_0816DAB0
	ldr r5, [r4]
	ldr r1, [r5]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	bl sub_08059674
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805F7E8
	b _0805F8EA
_0805F7E8:
	ldr r0, [r5]
	bl sub_080202A4
	movs r6, #0
	ldr r1, _0805F878 @ =gUnknown_08499590
	ldr r0, [r1]
	ldr r4, [sp, #8]
	ldrh r0, [r0, #2]
	cmp r4, r0
	bge _0805F8CA
	adds r7, r1, #0
_0805F7FE:
	movs r5, #0
	ldr r0, [r7]
	adds r1, r6, #1
	mov r8, r1
	ldrh r0, [r0]
	cmp r5, r0
	bge _0805F8C0
	ldr r2, _0805F87C @ =gUnknown_085D584C
	mov sl, r2
	ldr r4, _0805F880 @ =gUnknown_03003340
	mov sb, r4
_0805F814:
	lsls r0, r6, #2
	add r0, sb
	ldr r0, [r0]
	adds r1, r0, r5
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0805F8B6
	adds r3, r0, #0
	ldr r0, _0805F884 @ =gUnknown_030040D8
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805F840
	ldr r2, _0805F888 @ =gUnknown_085D5ABC
	adds r1, r0, #0
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	cmp r0, #0x10
	beq _0805F894
_0805F840:
	ldr r1, [r7]
	lsls r2, r6, #1
	ldr r4, _0805F88C @ =0x0000417A
	adds r0, r1, r4
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _0805F890 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r1, #0x1f
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r3, #0
	subs r1, #0x14
	subs r4, r0, r1
	b _0805F898
	.align 2, 0
_0805F874: .4byte gUnknown_0816DAB0
_0805F878: .4byte gUnknown_08499590
_0805F87C: .4byte gUnknown_085D584C
_0805F880: .4byte gUnknown_03003340
_0805F884: .4byte gUnknown_030040D8
_0805F888: .4byte gUnknown_085D5ABC
_0805F88C: .4byte 0x0000417A
_0805F890: .4byte 0x00001432
_0805F894:
	movs r0, #0x14
	subs r4, r0, r3
_0805F898:
	ldr r0, [sp, #0xc]
	cmp r4, r0
	ble _0805F8B6
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl sub_08059674
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805F8B6
	str r5, [sp, #4]
	str r6, [sp, #8]
	str r4, [sp, #0xc]
_0805F8B6:
	adds r5, #1
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r5, r0
	blt _0805F814
_0805F8C0:
	mov r6, r8
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	cmp r6, r0
	blt _0805F7FE
_0805F8CA:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #4]
	cmp r1, r0
	beq _0805F8EA
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #8]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	str r2, [sp]
	movs r2, #2
	movs r3, #0
	bl sub_0805D648
_0805F8EA:
	ldr r0, _0805F90C @ =gUnknown_03003FC0
	ldrb r0, [r0, #2]
	bl sub_08035000
	adds r0, #0x28
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805F902
	bl sub_0805F6D4
_0805F902:
	ldr r0, _0805F910 @ =gUnknown_03004680
	movs r1, #1
	bl sub_08071910
	.align 2, 0
_0805F90C: .4byte gUnknown_03003FC0
_0805F910: .4byte gUnknown_03004680

