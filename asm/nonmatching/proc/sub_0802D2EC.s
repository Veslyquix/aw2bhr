	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D2EC
sub_0802D2EC: @ 0x0802D2EC
	push {r4, r5, lr}
	ldr r0, _0802D334 @ =gUnknown_03002B6C
	ldr r1, [r0]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	movs r2, #0xda
	lsls r2, r2, #1
	movs r0, #0
	movs r3, #0xa
	bl sub_0801F150
	movs r4, #0
	ldr r1, _0802D338 @ =gUnknown_0849AAA8
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0802D32C
	adds r5, r1, #0
_0802D316:
	adds r0, r4, r5
	ldrb r0, [r0]
	bl sub_0801F234
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0802D316
_0802D32C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D334: .4byte gUnknown_03002B6C
_0802D338: .4byte gUnknown_0849AAA8

