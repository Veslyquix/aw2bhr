	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080373F0
sub_080373F0: @ 0x080373F0
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r3, r2, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r1, _08037418 @ =gUnknown_03003FC0
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803741C
	adds r0, r2, #0
	bl sub_0802490C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r4
	beq _0803743E
	b _08037428
	.align 2, 0
_08037418: .4byte gUnknown_03003FC0
_0803741C:
	adds r0, r2, #0
	subs r0, #0xb7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bhi _0803742C
_08037428:
	movs r0, #0
	b _08037440
_0803742C:
	ldrb r0, [r1, #1]
	cmp r0, #3
	bne _0803743E
	adds r0, r3, #0
	bl sub_0803CC64
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037428
_0803743E:
	movs r0, #1
_08037440:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

