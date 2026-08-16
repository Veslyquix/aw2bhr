	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080152EC
sub_080152EC: @ 0x080152EC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r0, #0
	bl sub_08015BD0
	lsls r1, r0, #0x18
	asrs r4, r1, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0801530A
	movs r0, #0
	b _0801531E
_0801530A:
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	adds r2, r5, #0
	bl sub_0801527C
	ldr r1, _08015324 @ =gUnknown_03001470
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #5
	adds r0, r0, r1
_0801531E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08015324: .4byte gUnknown_03001470

