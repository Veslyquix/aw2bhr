	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080277BC
sub_080277BC: @ 0x080277BC
	push {r4, r5, r6, lr}
	ldr r5, _08027838 @ =gUnknown_03001470
	ldr r6, _0802783C @ =gUnknown_03001FBC
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r5
	ldrh r1, [r0, #0x24]
	adds r1, #1
	strh r1, [r0, #0x24]
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r4, _08027840 @ =gUnknown_08090AA8
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x24
	ldrsh r1, [r1, r2]
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl sub_080157A4
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x24
	ldrsh r1, [r1, r2]
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl sub_080157F4
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r5
	movs r1, #0x24
	ldrsh r0, [r0, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne _08027832
	ldrb r0, [r6]
	bl sub_08015C30
_08027832:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08027838: .4byte gUnknown_03001470
_0802783C: .4byte gUnknown_03001FBC
_08027840: .4byte gUnknown_08090AA8

