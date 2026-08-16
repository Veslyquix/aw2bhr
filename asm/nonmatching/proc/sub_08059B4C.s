	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08059B4C
sub_08059B4C: @ 0x08059B4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r3
	ldr r0, [sp, #0x20]
	mov sb, r0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldr r2, _08059BE4 @ =gUnknown_03004788
	ldr r0, [r2]
	cmp r1, r0
	ble _08059B6C
	ldr r1, [r2]
_08059B6C:
	adds r0, r4, #0
	bl __divsi3
	adds r6, r0, #0
_08059B74:
	ldr r1, _08059BE8 @ =0xFFFF0000
	ldr r0, [sp]
	ands r0, r1
	ldr r4, _08059BEC @ =0x0000270F
	orrs r0, r4
	str r0, [sp]
	mov r5, sp
	mov r0, r8
	mov r1, sp
	bl sub_08059C00
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, r4
	beq _08059BD4
	ldr r0, _08059BF0 @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r1, [r5, #2]
	lsls r1, r1, #1
	ldr r3, _08059BF4 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	mov r0, sp
	ldrh r0, [r0]
	adds r1, r1, r0
	ldr r0, _08059BF8 @ =0x0000193A
	adds r2, r2, r0
	adds r2, r2, r1
	movs r0, #0
	ldrsb r0, [r2, r0]
	ldr r1, _08059BFC @ =gUnknown_084995A0
	ldr r1, [r1]
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #3
	adds r1, r0, r7
	ldrb r0, [r1]
	cmp r6, r0
	blt _08059B74
	adds r0, #1
	strb r0, [r1]
	mov r0, sp
	ldrh r0, [r0]
	mov r1, sb
	strh r0, [r1]
	ldrh r0, [r5, #2]
	strh r0, [r1, #2]
_08059BD4:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059BE4: .4byte gUnknown_03004788
_08059BE8: .4byte 0xFFFF0000
_08059BEC: .4byte 0x0000270F
_08059BF0: .4byte gUnknown_08499590
_08059BF4: .4byte 0x0000417A
_08059BF8: .4byte 0x0000193A
_08059BFC: .4byte gUnknown_084995A0

