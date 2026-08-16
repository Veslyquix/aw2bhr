	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013C00
sub_08013C00: @ 0x08013C00
	push {r4, r5, lr}
	movs r2, #0
	ldr r5, _08013C48 @ =gUnknown_08499578
	movs r4, #0
	ldr r3, _08013C4C @ =0x000003FF
_08013C0A:
	ldr r0, [r5]
	lsls r1, r2, #1
	adds r1, r1, r0
	strh r4, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	bls _08013C0A
	movs r2, #0
	ldr r5, _08013C50 @ =gUnknown_03002B6C
	movs r4, #0xc0
	lsls r4, r4, #0x13
	movs r3, #0
_08013C26:
	ldr r0, [r5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	lsls r1, r2, #1
	adds r0, r0, r1
	adds r0, r0, r4
	strh r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xf
	bls _08013C26
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013C48: .4byte gUnknown_08499578
_08013C4C: .4byte 0x000003FF
_08013C50: .4byte gUnknown_03002B6C

