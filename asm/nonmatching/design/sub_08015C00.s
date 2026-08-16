	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015C00
sub_08015C00: @ 0x08015C00
	adds r2, r0, #0
	movs r1, #0
	ldr r3, _08015C18 @ =gUnknown_03001470
_08015C06:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, r2
	bne _08015C1C
	movs r0, #1
	b _08015C28
	.align 2, 0
_08015C18: .4byte gUnknown_03001470
_08015C1C:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x1d
	bls _08015C06
	movs r0, #0
_08015C28:
	bx lr
	.align 2, 0

