	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072CE4
sub_08072CE4: @ 0x08072CE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	movs r0, #0
	mov sb, r0
	ldr r0, [r7, #0x58]
	cmp sb, r0
	blt _08072CFE
	b _08072E3C
_08072CFE:
	ldr r1, _08072D24 @ =gUnknown_0808F100
	str r1, [sp, #4]
	adds r2, r7, #0
	adds r2, #0x5f
	str r2, [sp, #8]
	movs r4, #0
	mov sl, r4
_08072D0C:
	mov r0, sb
	lsls r1, r0, #2
	ldr r0, [r7, #0x64]
	cmp r0, r1
	bge _08072D18
	b _08072E2C
_08072D18:
	subs r0, r0, r1
	cmp r0, #0x14
	ble _08072D28
	movs r2, #0x80
	lsls r2, r2, #1
	b _08072D30
	.align 2, 0
_08072D24: .4byte gUnknown_0808F100
_08072D28:
	ldr r1, _08072D68 @ =gUnknown_081CBFC8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
_08072D30:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r2, r0
	bne _08072D70
	adds r0, r7, #0
	adds r0, #0x2a
	add r0, sl
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r7, #0
	adds r0, #0x54
	ldrb r2, [r0]
	adds r0, #8
	mov r4, sb
	lsls r3, r4, #3
	ldrh r0, [r0]
	adds r3, r3, r0
	adds r0, r7, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	adds r3, r3, r0
	str r3, [sp]
	movs r0, #1
	ldr r3, _08072D6C @ =gUnknown_081CC01C
	bl sub_0801BEBC
	b _08072E2C
	.align 2, 0
_08072D68: .4byte gUnknown_081CBFC8
_08072D6C: .4byte gUnknown_081CC01C
_08072D70:
	ldr r0, [sp, #4]
	adds r0, #0x80
	movs r1, #0
	ldrsh r5, [r0, r1]
	lsls r5, r5, #4
	adds r0, r5, #0
	adds r1, r2, #0
	str r2, [sp, #0xc]
	bl Div
	mov r8, r0
	mov r4, r8
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r8, r4
	ldr r0, [sp, #4]
	movs r1, #0
	ldrsh r4, [r0, r1]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	ldr r2, [sp, #0xc]
	adds r1, r2, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	ldr r2, [sp, #0xc]
	adds r1, r2, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	ldr r2, [sp, #0xc]
	adds r1, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #8]
	ldrb r1, [r2]
	movs r5, #7
	mov r2, sb
	ands r5, r2
	adds r1, r1, r5
	str r0, [sp]
	adds r0, r1, #0
	mov r1, r8
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_0801E108
	adds r0, r7, #0
	adds r0, #0x2a
	add r0, sl
	movs r4, #0
	ldrsh r1, [r0, r4]
	subs r1, #8
	ldr r0, _08072E68 @ =0x000001FF
	ands r1, r0
	ldr r2, [sp, #8]
	ldrb r0, [r2]
	adds r0, r0, r5
	lsls r0, r0, #9
	orrs r1, r0
	adds r0, r7, #0
	adds r0, #0x54
	ldrb r2, [r0]
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	orrs r2, r0
	adds r0, r7, #0
	adds r0, #0x5c
	mov r4, sb
	lsls r3, r4, #3
	ldrh r0, [r0]
	adds r3, r3, r0
	adds r0, r7, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	adds r3, r3, r0
	str r3, [sp]
	movs r0, #1
	ldr r3, _08072E6C @ =gUnknown_081CC01C
	bl sub_0801BEFC
_08072E2C:
	movs r0, #2
	add sl, r0
	movs r1, #1
	add sb, r1
	ldr r0, [r7, #0x58]
	cmp sb, r0
	bge _08072E3C
	b _08072D0C
_08072E3C:
	ldr r0, [r7, #0x64]
	adds r0, #1
	str r0, [r7, #0x64]
	adds r1, r7, #0
	adds r1, #0x60
	ldrh r1, [r1]
	cmp r0, r1
	ble _08072E56
	movs r0, #0
	str r0, [r7, #0x64]
	adds r0, r7, #0
	bl Proc_Break
_08072E56:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072E68: .4byte 0x000001FF
_08072E6C: .4byte gUnknown_081CC01C

