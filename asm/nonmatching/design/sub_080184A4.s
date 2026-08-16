	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080184A4
sub_080184A4: @ 0x080184A4
	push {lr}
	ldr r1, _080184C0 @ =gUnknown_0848A370
	ldr r0, _080184C4 @ =gUnknown_03002F90
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_08012A54
	bl sub_0803B3E0
	pop {r0}
	bx r0
	.align 2, 0
_080184C0: .4byte gUnknown_0848A370
_080184C4: .4byte gUnknown_03002F90

