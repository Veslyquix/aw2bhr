	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08054EE0
sub_08054EE0: @ 0x08054EE0
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #2
	beq _08054F1C
	lsls r1, r4, #0xd
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r0, r2, #0
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r4, #8
	adds r0, #0x50
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08054F14 @ =gUnknown_08540FBC
	ldr r2, _08054F18 @ =0x06010000
	adds r1, r1, r2
	movs r2, #0xa2
	lsls r2, r2, #2
	bl CpuFastSet
	b _08054F1E
	.align 2, 0
_08054F14: .4byte gUnknown_08540FBC
_08054F18: .4byte 0x06010000
_08054F1C:
	movs r5, #0x50
_08054F1E:
	ldr r2, _08054F44 @ =gUnknown_020297C0
	lsls r1, r4, #3
	adds r1, r1, r4
	lsls r0, r1, #2
	adds r0, r0, r2
	strh r5, [r0]
	ldr r2, _08054F48 @ =gUnknown_020296B0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	strh r5, [r0]
	ldr r0, _08054F4C @ =gUnknown_020298E0
	lsls r1, r1, #4
	adds r1, r1, r0
	strh r5, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08054F44: .4byte gUnknown_020297C0
_08054F48: .4byte gUnknown_020296B0
_08054F4C: .4byte gUnknown_020298E0

