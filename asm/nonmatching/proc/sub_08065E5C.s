	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065E5C
sub_08065E5C: @ 0x08065E5C
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r1, _08065EAC @ =gUnknown_08580934
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	cmp r4, r0
	bge _08065EA6
	adds r6, r1, #0
	ldr r5, _08065EB0 @ =gUnknown_03002040
_08065E6E:
	ldr r3, [r6]
	adds r0, r3, #0
	adds r0, #0x70
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08065E9A
	ldrh r1, [r5, #2]
	movs r2, #0
	adds r0, r3, #0
	adds r0, #0x25
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bne _08065E94
	movs r2, #1
_08065E94:
	adds r0, r4, #0
	bl sub_08065DAC
_08065E9A:
	adds r5, #0x14
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #8]
	cmp r4, r0
	blt _08065E6E
_08065EA6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08065EAC: .4byte gUnknown_08580934
_08065EB0: .4byte gUnknown_03002040

