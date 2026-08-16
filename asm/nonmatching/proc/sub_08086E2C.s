	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08086E2C
sub_08086E2C: @ 0x08086E2C
	push {lr}
	ldr r0, _08086E48 @ =gUnknown_0823FD7C
	ldr r1, _08086E4C @ =gUnknown_03001FE8
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _08086E50 @ =0x06004000
	adds r1, r1, r2
	bl sub_08011CAC
	pop {r0}
	bx r0
	.align 2, 0
_08086E48: .4byte gUnknown_0823FD7C
_08086E4C: .4byte gUnknown_03001FE8
_08086E50: .4byte 0x06004000

