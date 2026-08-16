	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080349E4
sub_080349E4: @ 0x080349E4
	push {r4, lr}
	bl sub_080348B4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080349F4
	bl sub_0802BFA8
_080349F4:
	bl sub_08024584
	ldr r0, _08034A34 @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_08026704
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _08034A38 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r4, [r1, #0x1a]
	ldr r1, _08034A3C @ =0x06010000
	movs r2, #0xe5
	lsls r2, r2, #1
	movs r0, #1
	movs r3, #0x13
	bl sub_0801F150
	adds r4, #0x3d
	adds r0, r4, #0
	bl sub_0801F234
	ldr r1, _08034A40 @ =gUnknown_030032D8
	movs r0, #3
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034A34: .4byte gUnknown_030033EC
_08034A38: .4byte gUnknown_08499598
_08034A3C: .4byte 0x06010000
_08034A40: .4byte gUnknown_030032D8

