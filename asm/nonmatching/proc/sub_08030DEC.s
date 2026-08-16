	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030DEC
sub_08030DEC: @ 0x08030DEC
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _08030E0C @ =gUnknown_03003FF8
_08030DF2:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	bl sub_0802F460
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08030E10
	adds r2, r4, #1
	adds r1, r2, r5
	adds r0, r4, #3
	b _08030E16
	.align 2, 0
_08030E0C: .4byte gUnknown_03003FF8
_08030E10:
	adds r2, r4, #1
	adds r1, r2, r5
	movs r0, #0
_08030E16:
	strb r0, [r1]
	adds r4, r2, #0
	cmp r4, #3
	ble _08030DF2
	ldr r1, _08030E38 @ =gUnknown_03003FC0
	ldr r0, _08030E3C @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r1, #0x39
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030E38: .4byte gUnknown_03003FC0
_08030E3C: .4byte gUnknown_0849B018

