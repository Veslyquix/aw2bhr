	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014824
sub_08014824: @ 0x08014824
	push {r4, r5, lr}
	ldr r0, _0801486C @ =gUnknown_08489530
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r5, #1
	rsbs r5, r5, #0
	mvns r0, r0
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	ldr r0, _08014870 @ =gUnknown_08489548
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	beq _0801484C
	adds r4, #1
_0801484C:
	ldr r0, _08014874 @ =gUnknown_08489568
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	beq _0801485C
	adds r4, #1
_0801485C:
	movs r0, #0
	cmp r4, #0
	ble _08014864
	movs r0, #1
_08014864:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801486C: .4byte gUnknown_08489530
_08014870: .4byte gUnknown_08489548
_08014874: .4byte gUnknown_08489568

