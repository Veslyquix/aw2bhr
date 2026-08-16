	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061B4C
sub_08061B4C: @ 0x08061B4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r4, _08061CB4 @ =gUnknown_08499590
	ldr r0, [r4]
	ldr r1, _08061CB8 @ =0x00002852
	adds r0, r0, r1
	bl sub_0801F92C
	ldr r0, [r4]
	ldr r2, _08061CBC @ =0x0000376A
	adds r0, r0, r2
	movs r1, #0
	bl sub_080581A4
	movs r7, #0
	ldr r1, _08061CC0 @ =gUnknown_084995A0
	ldr r0, [r1]
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08061B7E
	b _08061CA4
_08061B7E:
	mov sl, r4
	mov sb, r1
_08061B82:
	mov r4, sl
	ldr r3, [r4]
	mov r5, sb
	ldr r2, [r5]
	lsls r4, r7, #3
	adds r2, r4, r2
	ldrb r1, [r2, #2]
	lsls r1, r1, #1
	ldr r6, _08061CC4 @ =0x0000417A
	adds r0, r3, r6
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r2, #1]
	adds r1, r1, r0
	ldr r0, _08061CC8 @ =0x00001432
	adds r3, r3, r0
	adds r3, r3, r1
	ldrb r1, [r3]
	movs r0, #0x1f
	ands r0, r1
	adds r5, r4, #0
	adds r1, r7, #1
	mov r8, r1
	cmp r0, #0x13
	beq _08061C92
	ldr r6, _08061CCC @ =gUnknown_03003F2C
	movs r2, #0
	ldrsh r0, [r6, r2]
	ldrb r1, [r3]
	bl sub_08026FD0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08061C92
	mov r4, sl
	ldr r3, [r4]
	mov r0, sb
	ldr r2, [r0]
	adds r2, r5, r2
	ldrb r1, [r2, #2]
	lsls r1, r1, #1
	ldr r4, _08061CC4 @ =0x0000417A
	adds r0, r3, r4
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r2, #1]
	adds r1, r1, r0
	adds r3, #0x12
	adds r3, r3, r1
	ldrb r4, [r3]
	cmp r4, #0
	beq _08061C10
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r1, r4, #0
	bl sub_08026F9C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08061C10
	ldr r0, _08061CD0 @ =gUnknown_08499594
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bls _08061C92
_08061C10:
	ldr r3, _08061CD4 @ =gUnknown_030013EC
	mov r2, sb
	ldr r1, [r2]
	adds r1, r5, r1
	ldrb r0, [r1, #1]
	ldrb r1, [r1, #2]
	movs r2, #0
	str r2, [sp]
	ldr r4, [r3]
	movs r2, #1
	movs r3, #3
	bl _call_via_r4
	movs r1, #0
	mov r3, sl
	ldr r0, [r3]
	adds r7, #1
	mov r8, r7
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _08061C92
	ldr r7, _08061CB4 @ =gUnknown_08499590
	ldr r4, _08061CD8 @ =gUnknown_03003340
	mov ip, r4
_08061C40:
	movs r2, #0
	ldr r0, [r7]
	adds r5, r1, #1
	str r5, [sp, #4]
	ldrh r0, [r0]
	cmp r2, r0
	bge _08061C88
	lsls r0, r1, #2
	mov r6, ip
	adds r5, r0, r6
	ldr r3, _08061CB4 @ =gUnknown_08499590
	lsls r4, r1, #1
_08061C58:
	ldr r0, [r5]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08061C7E
	ldr r1, [r3]
	ldr r6, _08061CC4 @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r4
	ldrh r0, [r0]
	adds r0, r0, r2
	ldr r6, _08061CBC @ =0x0000376A
	adds r1, r1, r6
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08061C7E:
	adds r2, #1
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r2, r0
	blt _08061C58
_08061C88:
	ldr r1, [sp, #4]
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blt _08061C40
_08061C92:
	mov r7, r8
	mov r1, sb
	ldr r0, [r1]
	lsls r1, r7, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08061CA4
	b _08061B82
_08061CA4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061CB4: .4byte gUnknown_08499590
_08061CB8: .4byte 0x00002852
_08061CBC: .4byte 0x0000376A
_08061CC0: .4byte gUnknown_084995A0
_08061CC4: .4byte 0x0000417A
_08061CC8: .4byte 0x00001432
_08061CCC: .4byte gUnknown_03003F2C
_08061CD0: .4byte gUnknown_08499594
_08061CD4: .4byte gUnknown_030013EC
_08061CD8: .4byte gUnknown_03003340

