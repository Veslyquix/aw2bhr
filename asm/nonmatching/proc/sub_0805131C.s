	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805131C
sub_0805131C: @ 0x0805131C
	push {r4, r5, r6, r7, lr}
	ldr r2, _080513E0 @ =gUnknown_03001470
	ldr r4, _080513E4 @ =gUnknown_081360E8
	ldr r0, [r4]
	mov ip, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r0, r2, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldrh r5, [r0]
	adds r0, r2, #0
	adds r0, #0x34
	adds r0, r1, r0
	ldrh r6, [r0]
	adds r7, r2, #0
	adds r7, #0x2c
	adds r1, r1, r7
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r3, _080513E8 @ =gUnknown_081360EC
	ldr r1, [r3]
	movs r2, #1
	adds r0, r5, #0
	eors r0, r2
	lsls r0, r0, #4
	adds r1, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #2
	bne _08051390
	mov r2, ip
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r7
	ldr r0, [r1]
	cmp r0, #3
	ble _08051390
	movs r0, #0
	str r0, [r1]
	ldr r2, _080513EC @ =gUnknown_020298E0
	ldr r0, _080513F0 @ =gUnknown_0300453C
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r2
	adds r0, #0x8d
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
_08051390:
	ldr r2, _080513F4 @ =gUnknown_02029A10
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r5, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080513CA
	ldr r2, _080513F8 @ =gUnknown_085D6A48
	ldr r0, [r3]
	lsls r1, r5, #4
	adds r0, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	cmp r0, #1
	bne _080513CA
	ldr r0, [r4]
	movs r2, #0
	ldrsh r0, [r0, r2]
	bl sub_08015328
_080513CA:
	ldr r0, [r4]
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_080513FC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080513E0: .4byte gUnknown_03001470
_080513E4: .4byte gUnknown_081360E8
_080513E8: .4byte gUnknown_081360EC
_080513EC: .4byte gUnknown_020298E0
_080513F0: .4byte gUnknown_0300453C
_080513F4: .4byte gUnknown_02029A10
_080513F8: .4byte gUnknown_085D6A48

