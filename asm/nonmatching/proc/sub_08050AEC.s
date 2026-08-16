	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08050AEC
sub_08050AEC: @ 0x08050AEC
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	ldr r2, _08050B20 @ =gUnknown_02029A10
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r3, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0, #0x1a]
	cmp r0, #0
	bne _08050B36
	ldr r0, _08050B24 @ =gUnknown_0300450C
	ldrh r0, [r0]
	cmp r3, r0
	bne _08050B2C
	ldr r0, _08050B28 @ =gUnknown_02029664
	ldrb r1, [r0]
	movs r2, #1
	b _08050B32
	.align 2, 0
_08050B20: .4byte gUnknown_02029A10
_08050B24: .4byte gUnknown_0300450C
_08050B28: .4byte gUnknown_02029664
_08050B2C:
	ldr r0, _08050B5C @ =gUnknown_02029664
	ldrb r1, [r0]
	movs r2, #8
_08050B32:
	orrs r1, r2
	strb r1, [r0]
_08050B36:
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08050B54
	adds r0, r4, #0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08050B54
	adds r0, r4, #0
	bl sub_08015328
_08050B54:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050B5C: .4byte gUnknown_02029664

