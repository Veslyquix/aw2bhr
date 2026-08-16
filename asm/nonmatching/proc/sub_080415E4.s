	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080415E4
sub_080415E4: @ 0x080415E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08041690 @ =gUnknown_08091310
	ldr r1, [r0]
	ldr r6, [r1]
	movs r7, #0
	ldr r2, _08041694 @ =gUnknown_08499590
	ldr r1, [r2]
	mov sl, r0
	ldrh r1, [r1, #2]
	cmp r7, r1
	bge _08041670
	adds r3, r2, #0
_08041606:
	movs r5, #0
	ldr r0, [r3]
	adds r1, r7, #1
	mov sb, r1
	ldrh r0, [r0]
	cmp r5, r0
	bge _08041666
	ldr r1, _08041698 @ =gUnknown_03003340
	lsls r0, r7, #2
	adds r0, r0, r1
	mov r8, r0
_0804161C:
	mov r4, r8
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0804165C
	ldr r1, [r3]
	lsls r2, r7, #1
	ldr r4, _0804169C @ =0x0000417A
	adds r0, r1, r4
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r4, [r1]
	cmp r4, #0
	beq _0804165C
	ldr r0, _080416A0 @ =gUnknown_03003F38
	ldrb r1, [r0]
	adds r0, r4, #0
	str r3, [sp]
	bl sub_08025EF0
	lsls r0, r0, #0x18
	ldr r3, [sp]
	cmp r0, #0
	beq _0804165C
	strh r4, [r6]
	adds r6, #8
_0804165C:
	adds r5, #1
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r5, r0
	blt _0804161C
_08041666:
	mov r7, sb
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	cmp r7, r0
	blt _08041606
_08041670:
	movs r0, #0
	strh r0, [r6]
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	subs r0, r6, r0
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
_08041690: .4byte gUnknown_08091310
_08041694: .4byte gUnknown_08499590
_08041698: .4byte gUnknown_03003340
_0804169C: .4byte 0x0000417A
_080416A0: .4byte gUnknown_03003F38

