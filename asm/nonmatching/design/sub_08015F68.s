	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015F68
sub_08015F68: @ 0x08015F68
	push {r4, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08015F94 @ =gUnknown_03001470
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #4
	adds r4, r0, r1
	ldr r1, [r4]
	ldr r1, [r1]
	adds r0, r0, r2
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08015F98
	movs r0, #0
	b _08015FA0
	.align 2, 0
_08015F94: .4byte gUnknown_03001470
_08015F98:
	ldr r0, [r4]
	adds r0, #8
	str r0, [r4]
	movs r0, #1
_08015FA0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

