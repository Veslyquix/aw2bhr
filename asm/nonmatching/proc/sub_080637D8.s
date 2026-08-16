	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080637D8
sub_080637D8: @ 0x080637D8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0x1d
	ldr r0, _08063804 @ =gUnknown_03001470
	movs r1, #0xae
	lsls r1, r1, #4
	adds r5, r0, r1
_080637E6:
	ldr r0, [r5]
	cmp r0, r6
	bne _080637F4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_08015A30
_080637F4:
	subs r5, #0x60
	subs r4, #1
	cmp r4, #0
	bge _080637E6
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08063804: .4byte gUnknown_03001470

