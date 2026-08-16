	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080416A4
sub_080416A4: @ 0x080416A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08041748 @ =gUnknown_08091314
	ldr r1, [r0]
	ldr r5, [r1]
	movs r6, #0
	ldr r2, _0804174C @ =gUnknown_08499590
	ldr r1, [r2]
	mov sb, r0
	ldrh r1, [r1, #2]
	cmp r6, r1
	bge _0804172A
	adds r7, r2, #0
_080416C6:
	movs r4, #0
	ldr r0, [r7]
	adds r1, r6, #1
	mov r8, r1
	ldrh r0, [r0]
	cmp r4, r0
	bge _08041720
	ldr r1, _08041750 @ =gUnknown_03003340
	lsls r0, r6, #2
	adds r0, r0, r1
	mov sl, r0
_080416DC:
	mov r3, sl
	ldr r0, [r3]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08041716
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl sub_0804209C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08041716
	ldr r1, [r7]
	lsls r2, r6, #1
	ldr r3, _08041754 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r0, [r1]
	strh r0, [r5]
	adds r5, #8
_08041716:
	adds r4, #1
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r4, r0
	blt _080416DC
_08041720:
	mov r6, r8
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	cmp r6, r0
	blt _080416C6
_0804172A:
	movs r0, #0
	strh r0, [r5]
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	subs r0, r5, r0
	asrs r0, r0, #3
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041748: .4byte gUnknown_08091314
_0804174C: .4byte gUnknown_08499590
_08041750: .4byte gUnknown_03003340
_08041754: .4byte 0x0000417A

