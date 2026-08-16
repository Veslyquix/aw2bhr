	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045A78
sub_08045A78: @ 0x08045A78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r6, #0
	movs r7, #0
	ldr r2, _08045AFC @ =gUnknown_084995FE
	ldr r1, _08045B00 @ =gUnknown_0812A0F8
	ldr r0, [r1]
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #1
	adds r0, #0x33
	mov sl, r1
	cmp r4, r0
	bge _08045AF0
	ldr r0, _08045B04 @ =gUnknown_08499594
	mov sb, r0
	mov r8, r2
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r5, r0, #2
_08045AAA:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _08045ADA
	cmp r1, #0x13
	bne _08045ADA
	adds r6, #1
	ldrb r1, [r0, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08045AD8
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r0, #1
	cmp r0, #9
	bgt _08045ADA
_08045AD8:
	adds r7, #1
_08045ADA:
	adds r5, #0xc
	adds r4, #1
	mov r1, sl
	ldr r0, [r1]
	ldrh r0, [r0]
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	adds r0, #0x33
	cmp r4, r0
	blt _08045AAA
_08045AF0:
	cmp r6, #1
	ble _08045B08
	cmp r7, #0
	beq _08045B08
	movs r0, #1
	b _08045B0A
	.align 2, 0
_08045AFC: .4byte gUnknown_084995FE
_08045B00: .4byte gUnknown_0812A0F8
_08045B04: .4byte gUnknown_08499594
_08045B08:
	movs r0, #0
_08045B0A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

