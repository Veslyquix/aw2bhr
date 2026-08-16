	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802672C
sub_0802672C: @ 0x0802672C
	push {r4, r5, lr}
	ldr r1, _0802675C @ =gUnknown_08090A70
	ldr r0, [r1]
	ldrh r4, [r0]
	adds r5, r1, #0
_08026736:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bne _08026742
	movs r4, #1
_08026742:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08026736
	ldr r0, [r5]
	ldrh r0, [r0]
	cmp r4, r0
	blo _08026760
	movs r0, #0
	b _08026762
	.align 2, 0
_0802675C: .4byte gUnknown_08090A70
_08026760:
	movs r0, #1
_08026762:
	pop {r4, r5}
	pop {r1}
	bx r1

