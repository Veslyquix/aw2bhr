	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015328
sub_08015328: @ 0x08015328
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	ldr r6, _08015374 @ =gUnknown_03001FBC
	ldrh r7, [r6]
	ldr r2, _08015378 @ =gUnknown_03001470
	lsrs r3, r0, #0x10
	asrs r5, r0, #0x10
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #5
	adds r4, r0, r2
	movs r1, #0
	str r1, [r4]
	adds r2, #0xc
	adds r0, r0, r2
	ldr r1, [r0]
	cmp r1, #0
	beq _08015354
	strh r3, [r6]
	adds r0, r4, #0
	bl _call_via_r1
_08015354:
	ldrh r1, [r4, #0x12]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801536C
	adds r0, r5, #0
	bl sub_080168BC
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	bl sub_08015568
_0801536C:
	strh r7, [r6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015374: .4byte gUnknown_03001FBC
_08015378: .4byte gUnknown_03001470

