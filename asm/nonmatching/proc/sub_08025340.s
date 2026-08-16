	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025340
sub_08025340: @ 0x08025340
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r1, _08025370 @ =gUnknown_08499594
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r2, [r1, #1]
	movs r0, #2
	orrs r0, r2
	strb r0, [r1, #1]
	ldr r0, _08025374 @ =gUnknown_03003FC0
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0802536C
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r3, #0
	bl sub_080211DC
_0802536C:
	pop {r0}
	bx r0
	.align 2, 0
_08025370: .4byte gUnknown_08499594
_08025374: .4byte gUnknown_03003FC0

