	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015EAC
sub_08015EAC: @ 0x08015EAC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08015ED8
	ldr r0, _08015ED4 @ =gUnknown_03001470
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #5
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, #8
	str r0, [r1]
	movs r0, #1
	b _08015EDA
	.align 2, 0
_08015ED4: .4byte gUnknown_03001470
_08015ED8:
	movs r0, #0
_08015EDA:
	pop {r4}
	pop {r1}
	bx r1

