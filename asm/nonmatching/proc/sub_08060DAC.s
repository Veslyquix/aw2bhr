	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060DAC
sub_08060DAC: @ 0x08060DAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r0, _08060EB8 @ =gUnknown_030045C8
	str r1, [r0]
	ldr r1, _08060EBC @ =gUnknown_084995A0
	ldr r0, [r1]
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08060E96
	adds r7, r1, #0
	ldr r2, _08060EC0 @ =gUnknown_085766E4
	mov r8, r2
	movs r6, #0
_08060DD6:
	ldr r1, [r7]
	adds r1, r6, r1
	ldrb r0, [r1, #1]
	ldrb r1, [r1, #2]
	bl sub_08042424
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08060E8A
	ldr r3, _08060EC4 @ =gUnknown_08499590
	ldr r4, [r3]
	ldr r2, [r7]
	adds r2, r6, r2
	ldrb r1, [r2, #2]
	lsls r1, r1, #1
	ldr r5, _08060EC8 @ =0x0000417A
	mov sl, r5
	adds r0, r4, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r2, [r2, #1]
	adds r1, r0, r2
	adds r0, r4, #0
	adds r0, #0x12
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08060E8A
	ldr r0, _08060ECC @ =gUnknown_085767F2
	mov sb, r0
	ldr r5, _08060ED0 @ =0x00001432
	adds r0, r4, r5
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x1f
	mov ip, r0
	ands r0, r1
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _08060E8A
	mov r1, r8
	ldr r0, [r1]
	ldr r5, [sp]
	lsls r4, r5, #2
	adds r0, r4, r0
	strb r2, [r0]
	ldr r1, [r1]
	adds r1, r4, r1
	ldr r0, [r7]
	adds r0, r6, r0
	ldrb r0, [r0, #2]
	strb r0, [r1, #1]
	mov r0, r8
	ldr r5, [r0]
	adds r5, r4, r5
	str r5, [sp, #8]
	ldr r3, [r3]
	ldr r2, [r7]
	adds r2, r6, r2
	ldrb r1, [r2, #2]
	lsls r1, r1, #1
	mov r5, sl
	adds r0, r3, r5
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r2, #1]
	adds r1, r1, r0
	ldr r0, _08060ED0 @ =0x00001432
	adds r3, r3, r0
	adds r3, r3, r1
	ldrb r1, [r3]
	mov r0, ip
	ands r0, r1
	add r0, sb
	ldrb r0, [r0]
	ldr r1, [sp, #8]
	strb r0, [r1, #2]
	mov r2, r8
	ldr r0, [r2]
	adds r4, r4, r0
	movs r0, #0x7f
	strb r0, [r4, #3]
	ldr r5, [sp]
	adds r5, #1
	str r5, [sp]
	ldr r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #4]
_08060E8A:
	adds r6, #8
	ldr r0, [r7]
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08060DD6
_08060E96:
	ldr r0, _08060EC0 @ =gUnknown_085766E4
	ldr r1, [r0]
	ldr r2, [sp]
	lsls r0, r2, #2
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [sp, #4]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08060EB8: .4byte gUnknown_030045C8
_08060EBC: .4byte gUnknown_084995A0
_08060EC0: .4byte gUnknown_085766E4
_08060EC4: .4byte gUnknown_08499590
_08060EC8: .4byte 0x0000417A
_08060ECC: .4byte gUnknown_085767F2
_08060ED0: .4byte 0x00001432

