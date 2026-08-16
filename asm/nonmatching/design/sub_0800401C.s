	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800401C
sub_0800401C: @ 0x0800401C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	mov r8, r2
	mov sb, r3
	ldr r0, [sp, #0x28]
	mov sl, r0
	asrs r0, r3, #1
	subs r6, r1, r0
	cmp r6, #0
	bge _0800403C
	movs r6, #0
_0800403C:
	mov r7, sb
	cmp r7, #0
	ble _080040B4
_08004042:
	mov r1, r8
	asrs r0, r1, #1
	ldr r2, [sp]
	subs r5, r2, r0
	cmp r5, #0
	bge _08004050
	movs r5, #0
_08004050:
	mov r4, r8
	adds r0, r6, #1
	str r0, [sp, #4]
	cmp r4, #0
	ble _080040A2
_0800405A:
	mov r1, r8
	cmp r1, #3
	bgt _08004076
	mov r2, sb
	cmp r2, #3
	bgt _08004076
	cmp r1, #3
	bne _08004090
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, sl
	bl sub_08003F44
	b _08004090
_08004076:
	cmp r7, sb
	beq _0800407E
	cmp r7, #1
	bne _08004086
_0800407E:
	cmp r4, r8
	beq _08004090
	cmp r4, #1
	beq _08004090
_08004086:
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, sl
	bl sub_08003F44
_08004090:
	adds r5, #1
	ldr r0, _080040C4 @ =gUnknown_08499590
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r5, r0
	bge _080040A2
	subs r4, #1
	cmp r4, #0
	bgt _0800405A
_080040A2:
	ldr r6, [sp, #4]
	ldr r0, _080040C4 @ =gUnknown_08499590
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r6, r0
	bge _080040B4
	subs r7, #1
	cmp r7, #0
	bgt _08004042
_080040B4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080040C4: .4byte gUnknown_08499590

