	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029880
sub_08029880: @ 0x08029880
	push {r4, r5, lr}
	ldr r0, _080298F8 @ =gUnknown_030040E4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08029932
	ldr r4, _080298FC @ =gUnknown_03001FBC
	movs r2, #0
	ldrsh r0, [r4, r2]
	bl sub_08015328
	ldr r5, _08029900 @ =gUnknown_03001470
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r0, r5
	movs r2, #0x24
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _080298B4
	movs r2, #0x22
	ldrsh r0, [r1, r2]
	bl sub_080428F0
_080298B4:
	bl sub_08034F48
	bl sub_08034F8C
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x24
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08029910
	bl sub_080258CC
	bl sub_0802CBC8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029910
	ldr r2, _08029904 @ =gUnknown_030033E4
	ldr r1, _08029908 @ =gUnknown_03003100
	ldrh r0, [r1]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	bl sub_0802D558
	ldr r1, _0802990C @ =gUnknown_03003334
	movs r0, #5
	strh r0, [r1]
	b _08029932
	.align 2, 0
_080298F8: .4byte gUnknown_030040E4
_080298FC: .4byte gUnknown_03001FBC
_08029900: .4byte gUnknown_03001470
_08029904: .4byte gUnknown_030033E4
_08029908: .4byte gUnknown_03003100
_0802990C: .4byte gUnknown_03003334
_08029910:
	ldr r1, _08029938 @ =gUnknown_03003334
	movs r0, #0
	strh r0, [r1]
	bl sub_080424FC
	ldr r0, _0802993C @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08029932
	ldr r0, _08029940 @ =gUnknown_03003F38
	ldrb r0, [r0]
	ldr r2, _08029944 @ =gUnknown_030033E8
	ldrb r1, [r2]
	ldrb r2, [r2, #1]
	bl sub_080344B4
_08029932:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029938: .4byte gUnknown_03003334
_0802993C: .4byte gUnknown_03003FC0
_08029940: .4byte gUnknown_03003F38
_08029944: .4byte gUnknown_030033E8

