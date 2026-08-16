	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016DB8
sub_08016DB8: @ 0x08016DB8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _08016DF0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08016DF4 @ =gUnknown_02000000
	bl sub_0801AC58
	bl sub_08017208
	ldr r0, _08016DF8 @ =gUnknown_03003FC0
	ldrb r0, [r0, #2]
	adds r0, #0x4c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb
	bhi _08016DEC
	ldr r0, _08016DFC @ =gUnknown_08499590
	ldr r1, [r0]
	ldr r0, _08016E00 @ =0x0000421A
	adds r1, r1, r0
	movs r0, #3
	bl sub_0803CF04
_08016DEC:
	bl sub_0801759C
_08016DF0:
	pop {r0}
	bx r0
	.align 2, 0
_08016DF4: .4byte gUnknown_02000000
_08016DF8: .4byte gUnknown_03003FC0
_08016DFC: .4byte gUnknown_08499590
_08016E00: .4byte 0x0000421A

