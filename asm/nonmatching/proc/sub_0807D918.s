	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807D918
sub_0807D918: @ 0x0807D918
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x4c
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0xd
	bne _0807D94C
	ldr r4, _0807D9DC @ =gUnknown_030058E0
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	ldr r2, _0807D9E0 @ =gUnknown_03005948
	ldr r1, [r5, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r5, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0x40
	movs r2, #1
	bl sub_08043BA4
_0807D94C:
	ldr r0, [r5, #0x60]
	cmp r0, #0
	bge _0807D9F0
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0xd
	bne _0807D97E
	ldr r4, _0807D9DC @ =gUnknown_030058E0
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	ldr r2, _0807D9E0 @ =gUnknown_03005948
	ldr r1, [r5, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r5, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _0807D9E4 @ =0x06013000
	movs r2, #0x12
	bl sub_08043E3C
_0807D97E:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0xe
	bne _0807D9AC
	ldr r4, _0807D9DC @ =gUnknown_030058E0
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	adds r0, #1
	ldr r2, _0807D9E0 @ =gUnknown_03005948
	ldr r1, [r5, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r5, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _0807D9E8 @ =0x06013480
	movs r2, #0x13
	bl sub_08043E3C
_0807D9AC:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0xf
	bne _0807DA7C
	ldr r4, _0807D9DC @ =gUnknown_030058E0
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	adds r0, #2
	ldr r2, _0807D9E0 @ =gUnknown_03005948
	ldr r1, [r5, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r5, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _0807D9EC @ =0x06013900
	movs r2, #0x14
	bl sub_08043E3C
	b _0807DA7C
	.align 2, 0
_0807D9DC: .4byte gUnknown_030058E0
_0807D9E0: .4byte gUnknown_03005948
_0807D9E4: .4byte 0x06013000
_0807D9E8: .4byte 0x06013480
_0807D9EC: .4byte 0x06013900
_0807D9F0:
	cmp r0, #0
	ble _0807DA7C
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0xd
	bne _0807DA20
	ldr r4, _0807DA84 @ =gUnknown_030058E0
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	ldr r2, _0807DA88 @ =gUnknown_03005948
	ldr r1, [r5, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r5, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _0807DA8C @ =0x06013000
	movs r2, #0x12
	bl sub_08043E3C
_0807DA20:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #9
	bne _0807DA4E
	ldr r4, _0807DA84 @ =gUnknown_030058E0
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	adds r0, #1
	ldr r2, _0807DA88 @ =gUnknown_03005948
	ldr r1, [r5, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r5, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _0807DA90 @ =0x06013480
	movs r2, #0x13
	bl sub_08043E3C
_0807DA4E:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #6
	bne _0807DA7C
	ldr r4, _0807DA84 @ =gUnknown_030058E0
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	adds r0, #2
	ldr r2, _0807DA88 @ =gUnknown_03005948
	ldr r1, [r5, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r5, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _0807DA94 @ =0x06013900
	movs r2, #0x14
	bl sub_08043E3C
_0807DA7C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807DA84: .4byte gUnknown_030058E0
_0807DA88: .4byte gUnknown_03005948
_0807DA8C: .4byte 0x06013000
_0807DA90: .4byte 0x06013480
_0807DA94: .4byte 0x06013900

