	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015954
sub_08015954: @ 0x08015954
	push {r4, r5, lr}
	movs r2, #0
	ldr r4, _08015990 @ =gUnknown_03001470
	movs r3, #1
_0801595C:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #5
	adds r1, r0, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _08015970
	ldrh r0, [r1, #0x12]
	orrs r0, r3
	strh r0, [r1, #0x12]
_08015970:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x1d
	bls _0801595C
_0801597A:
	bl sub_08015A9C
	bl sub_08015B94
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801597A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015990: .4byte gUnknown_03001470

