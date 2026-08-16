	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806377C
sub_0806377C: @ 0x0806377C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0x1d
	ldr r0, _080637A8 @ =gUnknown_03001470
	movs r1, #0xae
	lsls r1, r1, #4
	adds r5, r0, r1
_0806378A:
	ldr r0, [r5]
	cmp r0, r6
	bne _08063798
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_08015C30
_08063798:
	subs r5, #0x60
	subs r4, #1
	cmp r4, #0
	bge _0806378A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080637A8: .4byte gUnknown_03001470

