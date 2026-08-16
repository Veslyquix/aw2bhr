	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028904
sub_08028904: @ 0x08028904
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028934
	ldr r0, _08028938 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrh r0, [r1, #0x14]
	cmp r0, #0
	bne _0802893C
	adds r0, r1, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802893C
_08028934:
	movs r0, #0
	b _0802893E
	.align 2, 0
_08028938: .4byte gUnknown_08499598
_0802893C:
	movs r0, #1
_0802893E:
	pop {r4}
	pop {r1}
	bx r1

