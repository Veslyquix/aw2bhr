	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045490
sub_08045490: @ 0x08045490
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	bl sub_08025AEC
	cmp r0, #0
	bne _080454C0
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _08045540
_080454B0:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	bl sub_08029088
	b _08045540
_080454C0:
	ldr r1, _08045550 @ =gUnknown_08499590
	ldr r0, [r1]
	ldr r6, [r4, #0x30]
	ldrh r3, [r0, #2]
	cmp r6, r3
	bge _08045538
	mov sb, r0
_080454CE:
	ldr r2, [r4, #0x2c]
	ldr r6, [r4, #0x30]
	mov r7, sb
	ldrh r7, [r7]
	cmp r2, r7
	bge _08045528
	ldr r0, _08045550 @ =gUnknown_08499590
	ldr r5, [r0]
	mov sl, r6
	lsls r1, r6, #1
	ldr r3, _08045554 @ =0x0000417A
	adds r0, r5, r3
	adds r0, r0, r1
	mov r8, r0
	ldr r7, _08045558 @ =0x00001432
	adds r7, r7, r5
	mov ip, r7
	ldr r1, _0804555C @ =gUnknown_030033EC
	ldrh r0, [r1]
	lsls r3, r0, #5
	movs r0, #6
	orrs r3, r0
	ldr r7, _08045560 @ =0x0000051A
	adds r7, r5, r7
	str r7, [sp]
_08045500:
	mov r1, r8
	ldrh r0, [r1]
	adds r1, r0, r2
	mov r7, ip
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, r3
	bne _0804551A
	ldr r7, [sp]
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080454B0
_0804551A:
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	adds r2, r0, #0
	ldrh r0, [r5]
	cmp r2, r0
	blt _08045500
_08045528:
	movs r0, #0
	str r0, [r4, #0x2c]
	adds r0, r6, #1
	str r0, [r4, #0x30]
	mov r1, sb
	ldrh r1, [r1, #2]
	cmp r0, r1
	blt _080454CE
_08045538:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08045540:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045550: .4byte gUnknown_08499590
_08045554: .4byte 0x0000417A
_08045558: .4byte 0x00001432
_0804555C: .4byte gUnknown_030033EC
_08045560: .4byte 0x0000051A

