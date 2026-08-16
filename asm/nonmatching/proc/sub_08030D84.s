	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030D84
sub_08030D84: @ 0x08030D84
	push {r4, r5, lr}
	ldr r0, _08030DA0 @ =gUnknown_08090CEC
	ldr r1, [r0]
	ldr r2, [r1]
	ldrb r1, [r2, #0x1e]
	adds r4, r0, #0
	cmp r1, #0xf
	bhi _08030DA4
	ldrb r0, [r2, #0x1e]
	adds r0, #1
	ldrb r1, [r2, #0x1e]
	strb r0, [r2, #0x1e]
	b _08030DD8
	.align 2, 0
_08030DA0: .4byte gUnknown_08090CEC
_08030DA4:
	movs r2, #0
	ldr r5, _08030DE0 @ =gUnknown_020256DA
	ldr r3, _08030DE4 @ =gUnknown_0849B038
_08030DAA:
	adds r0, r2, r5
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #0xc
	ble _08030DAA
	ldr r0, _08030DE8 @ =gUnknown_020256D4
	movs r1, #0xad
	strb r1, [r0]
	ldr r4, [r4]
	ldr r2, [r4]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	movs r5, #0
	strh r1, [r0, #2]
	movs r1, #0x1a
	bl sub_0802F588
	ldr r0, [r4]
	ldrb r1, [r0, #0x1e]
	strb r5, [r0, #0x1e]
_08030DD8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030DE0: .4byte gUnknown_020256DA
_08030DE4: .4byte gUnknown_0849B038
_08030DE8: .4byte gUnknown_020256D4

