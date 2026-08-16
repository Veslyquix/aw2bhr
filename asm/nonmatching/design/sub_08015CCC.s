	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015CCC
sub_08015CCC: @ 0x08015CCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08015CE0 @ =gUnknown_03001470
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r2
	ldrb r0, [r1, #0x14]
	bx lr
	.align 2, 0
_08015CE0: .4byte gUnknown_03001470

