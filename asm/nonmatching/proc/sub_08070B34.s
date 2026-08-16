	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070B34
sub_08070B34: @ 0x08070B34
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #0
	beq _08070B98
	cmp r4, #0x10
	bls _08070B48
	movs r4, #0x10
_08070B48:
	ldr r0, _08070BA0 @ =gUnknown_03007FF0
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _08070BA4 @ =0x68736D53
	cmp r1, r0
	bne _08070B98
	adds r0, r1, #1
	str r0, [r5]
	adds r0, r7, #0
	bl sub_080707E0
	str r6, [r7, #0x2c]
	strb r4, [r7, #8]
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r7, #4]
	cmp r4, #0
	beq _08070B7C
	movs r1, #0
_08070B6E:
	strb r1, [r6]
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, #0x50
	cmp r4, #0
	bne _08070B6E
_08070B7C:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _08070B8C
	str r0, [r7, #0x38]
	ldr r0, [r5, #0x24]
	str r0, [r7, #0x3c]
	movs r0, #0
	str r0, [r5, #0x20]
_08070B8C:
	str r7, [r5, #0x24]
	ldr r0, _08070BA8 @ =sub_0806FDE4
	str r0, [r5, #0x20]
	ldr r0, _08070BA4 @ =0x68736D53
	str r0, [r5]
	str r0, [r7, #0x34]
_08070B98:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070BA0: .4byte gUnknown_03007FF0
_08070BA4: .4byte 0x68736D53
_08070BA8: .4byte sub_0806FDE4

