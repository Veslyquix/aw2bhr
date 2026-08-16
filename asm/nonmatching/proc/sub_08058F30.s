	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08058F30
sub_08058F30: @ 0x08058F30
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0x78
	strb r5, [r4]
	ldr r0, _08058F7C @ =gUnknown_030046B8
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08058F76
	ldr r1, _08058F80 @ =gUnknown_085D5ABC
	ldr r0, _08058F84 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r2, [r0]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r0, r0, r1
	ldrb r0, [r0, #0x1a]
	cmp r0, #7
	bne _08058F76
	ldr r0, _08058F88 @ =gUnknown_030033EC
	ldrh r0, [r0]
	adds r1, r2, #0
	bl sub_08042D1C
	ldr r1, _08058F8C @ =gUnknown_085766E0
	ldr r1, [r1]
	ldrb r1, [r1, #0xe]
	muls r0, r1, r0
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x78
	bls _08058F76
	strb r5, [r4]
_08058F76:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058F7C: .4byte gUnknown_030046B8
_08058F80: .4byte gUnknown_085D5ABC
_08058F84: .4byte gUnknown_030040D8
_08058F88: .4byte gUnknown_030033EC
_08058F8C: .4byte gUnknown_085766E0

