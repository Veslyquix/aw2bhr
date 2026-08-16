	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08021CB4
sub_08021CB4: @ 0x08021CB4
	push {r4, r5, r6, lr}
	ldr r1, _08021CF8 @ =gUnknown_03003150
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08021CF0
	ldr r6, _08021CFC @ =gUnknown_08499590
	adds r3, r1, #0
	ldr r5, _08021D00 @ =0x0000417A
	movs r0, #0xb6
	lsls r0, r0, #1
	adds r4, r3, r0
_08021CCA:
	ldr r2, [r6]
	ldrb r1, [r3, #2]
	lsls r1, r1, #1
	adds r0, r2, r5
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r3, #1]
	adds r1, r1, r0
	ldr r0, _08021D04 @ =0x00001432
	adds r2, r2, r0
	adds r2, r2, r1
	ldrb r0, [r2]
	strb r0, [r3]
	adds r3, #4
	cmp r3, r4
	bgt _08021CF0
	ldrb r0, [r3]
	cmp r0, #0xff
	bne _08021CCA
_08021CF0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021CF8: .4byte gUnknown_03003150
_08021CFC: .4byte gUnknown_08499590
_08021D00: .4byte 0x0000417A
_08021D04: .4byte 0x00001432

