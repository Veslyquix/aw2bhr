	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08059E3C
sub_08059E3C: @ 0x08059E3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r7, #0
	ldr r1, _08059F04 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r7, r0
	bge _08059EF0
	mov ip, r1
_08059E58:
	movs r5, #0
	mov r1, ip
	ldr r0, [r1]
	adds r6, r7, #1
	mov sb, r6
	ldrh r0, [r0]
	cmp r5, r0
	bge _08059EE4
	lsls r0, r7, #2
	ldr r1, _08059F08 @ =gUnknown_03003340
	adds r0, r0, r1
	str r0, [sp]
	lsls r6, r7, #1
	mov r8, r6
	ldr r0, _08059F0C @ =gUnknown_03004084
	mov sl, r0
_08059E78:
	ldr r1, [sp]
	ldr r0, [r1]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08059ED8
	mov r6, ip
	ldr r2, [r6]
	ldr r1, _08059F10 @ =0x0000417A
	adds r0, r2, r1
	add r0, r8
	ldrh r0, [r0]
	adds r3, r0, r5
	ldr r6, _08059F14 @ =0x00001432
	adds r0, r2, r6
	adds r0, r0, r3
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	ldr r6, _08059F18 @ =gUnknown_085767D5
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059ED8
	movs r0, #0xe0
	ands r0, r1
	mov r1, sl
	ldrh r1, [r1]
	cmp r0, r1
	bne _08059ED8
	ldr r6, _08059F1C @ =0x0000376A
	adds r0, r2, r6
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059ED8
	strb r5, [r4]
	strb r7, [r4, #1]
	ldr r1, [sp]
	ldr r0, [r1]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #2]
	adds r4, #4
_08059ED8:
	adds r5, #1
	mov r6, ip
	ldr r0, [r6]
	ldrh r0, [r0]
	cmp r5, r0
	blt _08059E78
_08059EE4:
	mov r7, sb
	mov r1, ip
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r7, r0
	blt _08059E58
_08059EF0:
	ldr r0, _08059F20 @ =0x0000FFFF
	strh r0, [r4, #2]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059F04: .4byte gUnknown_08499590
_08059F08: .4byte gUnknown_03003340
_08059F0C: .4byte gUnknown_03004084
_08059F10: .4byte 0x0000417A
_08059F14: .4byte 0x00001432
_08059F18: .4byte gUnknown_085767D5
_08059F1C: .4byte 0x0000376A
_08059F20: .4byte 0x0000FFFF

