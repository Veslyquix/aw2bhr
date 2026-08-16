	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080159E0
sub_080159E0: @ 0x080159E0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r6, r1, #0
	ldr r5, _08015A24 @ =gUnknown_03001470
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r4, r0, #5
	adds r2, r4, r5
	ldrh r3, [r2, #0x12]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08015A1E
	ldr r0, _08015A28 @ =gUnknown_03001FBC
	strh r1, [r0]
	ldr r0, _08015A2C @ =0x0000FFFE
	ands r0, r3
	strh r0, [r2, #0x12]
	adds r0, r5, #0
	adds r0, #8
	adds r0, r4, r0
	ldr r1, [r0]
	cmp r1, #0
	beq _08015A18
	adds r0, r2, #0
	bl _call_via_r1
_08015A18:
	adds r0, r6, #0
	bl sub_08015A30
_08015A1E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015A24: .4byte gUnknown_03001470
_08015A28: .4byte gUnknown_03001FBC
_08015A2C: .4byte 0x0000FFFE

