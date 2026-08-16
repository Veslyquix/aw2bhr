	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065DAC
sub_08065DAC: @ 0x08065DAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	ldr r0, _08065E50 @ =gUnknown_08580934
	mov sb, r0
	ldr r5, [r0]
	adds r0, r5, #0
	adds r0, #0x1c
	adds r0, r0, r6
	mov r8, r0
	ldrb r4, [r0]
	movs r0, #0x40
	ands r0, r7
	cmp r0, #0
	beq _08065DE8
	ldrb r1, [r5, #0x17]
	subs r0, r1, #1
	adds r0, r4, r0
	bl __modsi3
	adds r4, r0, #0
_08065DE8:
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _08065DFC
	ldrb r1, [r5, #0x17]
	adds r0, r1, #1
	adds r0, r4, r0
	bl __modsi3
	adds r4, r0, #0
_08065DFC:
	mov r1, r8
	ldrb r1, [r1]
	cmp r4, r1
	beq _08065E42
	mov r2, sl
	cmp r2, #0
	beq _08065E10
	movs r0, #0x64
	bl sub_0803B4DC
_08065E10:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0, #0x18]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r1, r6, #3
	adds r1, r1, r6
	lsls r1, r1, #2
	movs r2, #0xc8
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r2, _08065E54 @ =0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _08065E58 @ =0x06010000
	adds r1, r1, r2
	adds r2, r6, #0
	adds r2, #0x10
	bl sub_08043E3C
	mov r1, sb
	ldr r0, [r1]
	adds r0, #0x1c
	adds r0, r0, r6
	strb r4, [r0]
_08065E42:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065E50: .4byte gUnknown_08580934
_08065E54: .4byte 0x000003FF
_08065E58: .4byte 0x06010000

