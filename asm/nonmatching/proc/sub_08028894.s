	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028894
sub_08028894: @ 0x08028894
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	bl sub_08028848
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08028874
	ldr r0, _080288D0 @ =gUnknown_030033EC
	ldrh r0, [r0]
	cmp r0, r4
	bne _080288C0
	ldr r1, _080288D4 @ =gUnknown_030032D8
	movs r0, #1
	strh r0, [r1]
	bl sub_08025EA0
_080288C0:
	cmp r5, #2
	bne _080288C8
	bl sub_08028CD8
_080288C8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080288D0: .4byte gUnknown_030033EC
_080288D4: .4byte gUnknown_030032D8

