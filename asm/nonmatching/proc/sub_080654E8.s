	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080654E8
sub_080654E8: @ 0x080654E8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	bl sub_080733B8
	ldr r4, _08065598 @ =gUnknown_0816E0F8
	ldr r0, [r4]
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r4
	ldr r7, _0806559C @ =gUnknown_0816E0FC
	ldr r1, _080655A0 @ =gUnknown_0816E100
	mov r8, r1
	cmp r5, r0
	bne _0806552E
	ldr r0, [r7]
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, r5
	bne _0806552E
	mov r6, r8
	ldr r0, [r6]
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	beq _0806558C
_0806552E:
	movs r3, #0
	ldr r1, _080655A4 @ =gUnknown_08580934
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	cmp r3, r0
	bge _0806556A
	mov ip, r1
	movs r4, #0
	movs r5, #5
	rsbs r5, r5, #0
_08065542:
	mov r0, ip
	ldr r2, [r0]
	lsls r1, r3, #2
	adds r0, r2, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	movs r6, #0x28
	ldrsh r0, [r1, r6]
	cmp r0, #0
	bge _0806555A
	adds r0, #0x1f
_0806555A:
	asrs r0, r0, #5
	strh r0, [r1, #0x24]
	str r5, [r1, #0x34]
	str r4, [r1, #0x30]
	adds r3, #1
	ldrb r2, [r2, #8]
	cmp r3, r2
	blt _08065542
_0806556A:
	mov r1, sb
	ldr r0, [r1]
	bl sub_0806377C
	ldr r0, [r7]
	bl sub_0806377C
	mov r6, r8
	ldr r0, [r6]
	bl sub_0806377C
	ldr r0, _080655A8 @ =gUnknown_08580A38
	bl sub_0806377C
	ldr r0, _080655AC @ =gUnknown_08580A08
	bl sub_0806377C
_0806558C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065598: .4byte gUnknown_0816E0F8
_0806559C: .4byte gUnknown_0816E0FC
_080655A0: .4byte gUnknown_0816E100
_080655A4: .4byte gUnknown_08580934
_080655A8: .4byte gUnknown_08580A38
_080655AC: .4byte gUnknown_08580A08

