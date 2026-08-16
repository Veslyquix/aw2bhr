	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015FA8
sub_08015FA8: @ 0x08015FA8
	push {r4, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08015FD0 @ =gUnknown_03001470
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #4
	adds r4, r0, r1
	ldr r1, [r4]
	ldr r1, [r1]
	adds r0, r0, r2
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08015FD4
	movs r0, #0
	b _08015FDC
	.align 2, 0
_08015FD0: .4byte gUnknown_03001470
_08015FD4:
	ldr r0, [r4]
	adds r0, #8
	str r0, [r4]
	movs r0, #1
_08015FDC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

