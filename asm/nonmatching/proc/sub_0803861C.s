	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803861C
sub_0803861C: @ 0x0803861C
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_08038622:
	adds r0, r4, #0
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803864E
	ldr r0, _08038660 @ =gUnknown_08499598
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x66
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x2a
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803864E
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0803864E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _08038622
	cmp r5, #0
	bne _08038664
	movs r0, #0
	b _08038666
	.align 2, 0
_08038660: .4byte gUnknown_08499598
_08038664:
	movs r0, #1
_08038666:
	pop {r4, r5}
	pop {r1}
	bx r1

