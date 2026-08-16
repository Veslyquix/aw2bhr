	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080453CC
sub_080453CC: @ 0x080453CC
	push {r4, lr}
	ldr r0, _08045410 @ =gUnknown_08112704
	ldr r1, _08045414 @ =gUnknown_03002B6C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _08045418 @ =0x06005600
	adds r1, r1, r2
	bl sub_08011CAC
	ldr r0, _0804541C @ =gUnknown_0811315C
	ldr r4, _08045420 @ =gUnknown_08499578
	ldr r1, [r4]
	bl sub_08011CAC
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #4
	ldr r2, _08045424 @ =0x000082B0
	bl sub_08012B00
	ldr r0, _08045428 @ =gUnknown_08113BA0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_08013618
	bl sub_08013AEC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045410: .4byte gUnknown_08112704
_08045414: .4byte gUnknown_03002B6C
_08045418: .4byte 0x06005600
_0804541C: .4byte gUnknown_0811315C
_08045420: .4byte gUnknown_08499578
_08045424: .4byte 0x000082B0
_08045428: .4byte gUnknown_08113BA0

