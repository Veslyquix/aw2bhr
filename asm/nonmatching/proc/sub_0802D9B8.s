	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D9B8
sub_0802D9B8: @ 0x0802D9B8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	ldrh r2, [r4, #0x1e]
	movs r3, #0x1e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0802D9D2
	cmp r1, #0
	ble _0802D9D2
	subs r0, r2, #1
	strh r0, [r4, #0x1e]
_0802D9D2:
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	movs r3, #0x1e
	ldrsh r2, [r4, r3]
	adds r0, r2, #6
	cmp r1, r0
	bne _0802D9F0
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	subs r0, #7
	cmp r2, r0
	bgt _0802D9F0
	ldrh r0, [r4, #0x1e]
	adds r0, #1
	strh r0, [r4, #0x1e]
_0802D9F0:
	bl sub_0802D76C
	movs r2, #0x1e
	ldrsh r0, [r4, r2]
	bl sub_0802D7B4
	ldr r1, _0802DA14 @ =gUnknown_02023830
	movs r3, #0x20
	ldrsh r0, [r4, r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_0803AA78
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802DA14: .4byte gUnknown_02023830

