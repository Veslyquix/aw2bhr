	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028944
sub_08028944: @ 0x08028944
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r4, r2, #0
	ldr r0, _08028980 @ =gUnknown_03003FC0
	ldrb r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802897A
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028988
	ldr r0, _08028984 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08028988
_0802897A:
	movs r0, #1
	b _0802898A
	.align 2, 0
_08028980: .4byte gUnknown_03003FC0
_08028984: .4byte gUnknown_08499598
_08028988:
	movs r0, #0
_0802898A:
	pop {r4}
	pop {r1}
	bx r1

