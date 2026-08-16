	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015994
sub_08015994: @ 0x08015994
	push {r4, r5, lr}
	movs r3, #0
	ldr r4, _080159DC @ =gUnknown_03001470
	movs r5, #0x80
_0801599C:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #5
	adds r2, r0, r4
	ldr r0, [r2]
	cmp r0, #0
	beq _080159BC
	ldrb r1, [r2, #0x14]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _080159BC
	ldrh r1, [r2, #0x12]
	movs r0, #1
	orrs r0, r1
	strh r0, [r2, #0x12]
_080159BC:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x1d
	bls _0801599C
_080159C6:
	bl sub_08015A9C
	bl sub_08015B94
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080159C6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080159DC: .4byte gUnknown_03001470

