	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B780
sub_0801B780: @ 0x0801B780
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x28
	bl sub_0801B768
	ldr r0, _0801B7B4 @ =gUnknown_080A5524
	ldr r1, _0801B7B8 @ =gUnknown_03002B6C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	adds r4, #1
	ldr r2, _0801B7BC @ =0x000003FF
	ands r4, r2
	lsls r4, r4, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r4, r4, r2
	adds r1, r1, r4
	movs r2, #0xa0
	lsls r2, r2, #3
	bl sub_08011E54
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801B7B4: .4byte gUnknown_080A5524
_0801B7B8: .4byte gUnknown_03002B6C
_0801B7BC: .4byte 0x000003FF

