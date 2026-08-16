	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026768
sub_08026768: @ 0x08026768
	push {r4, lr}
	ldr r4, _08026794 @ =gUnknown_030033EC
_0802676C:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #5
	bne _08026782
	bl sub_080176A8
	movs r0, #1
	strh r0, [r4]
_08026782:
	ldrb r0, [r4]
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802676C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026794: .4byte gUnknown_030033EC

