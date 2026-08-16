	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025EA0
sub_08025EA0: @ 0x08025EA0
	push {r4, r5, r6, r7, lr}
	ldr r1, _08025EE8 @ =gUnknown_03003F2C
	ldrh r3, [r1]
	adds r0, r3, #0
	adds r0, #0x33
	cmp r3, r0
	bge _08025EE0
	ldr r7, _08025EEC @ =gUnknown_08499594
	adds r6, r1, #0
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r4, r0, #2
	movs r5, #8
_08025EBA:
	ldr r0, [r7]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08025ED4
	ldrb r2, [r1, #1]
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	bne _08025ED4
	movs r0, #0xfe
	ands r0, r2
	strb r0, [r1, #1]
_08025ED4:
	adds r4, #0xc
	adds r3, #1
	ldrh r0, [r6]
	adds r0, #0x33
	cmp r3, r0
	blt _08025EBA
_08025EE0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025EE8: .4byte gUnknown_03003F2C
_08025EEC: .4byte gUnknown_08499594

