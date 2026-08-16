	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029948
sub_08029948: @ 0x08029948
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08029970 @ =gUnknown_0849A080
	movs r1, #0
	bl sub_080152C0
	lsls r0, r0, #0x18
	ldr r2, _08029974 @ =gUnknown_03001470
	asrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r2
	strh r4, [r1, #0x22]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029970: .4byte gUnknown_0849A080
_08029974: .4byte gUnknown_03001470

