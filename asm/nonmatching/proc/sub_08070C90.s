	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070C90
sub_08070C90: @ 0x08070C90
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6, #0x34]
	ldr r0, _08070CCC @ =0x68736D53
	cmp r1, r0
	bne _08070CC6
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r6, #4]
	ldrb r4, [r6, #8]
	ldr r5, [r6, #0x2c]
	cmp r4, #0
	ble _08070CC2
_08070CB2:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0807004C
	subs r4, #1
	adds r5, #0x50
	cmp r4, #0
	bgt _08070CB2
_08070CC2:
	ldr r0, _08070CCC @ =0x68736D53
	str r0, [r6, #0x34]
_08070CC6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070CCC: .4byte 0x68736D53

