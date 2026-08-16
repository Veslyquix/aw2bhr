	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08020864
sub_08020864: @ 0x08020864
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r5, #1
	ldr r7, _08020878 @ =gUnknown_08499598
_0802086E:
	adds r4, r6, r5
	cmp r4, #4
	bgt _0802087C
	lsls r0, r4, #0x10
	b _08020880
	.align 2, 0
_08020878: .4byte gUnknown_08499598
_0802087C:
	subs r0, r4, #4
	lsls r0, r0, #0x10
_08020880:
	lsrs r1, r0, #0x10
	adds r0, r6, #0
	bl sub_08020824
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bne _080208B6
	cmp r4, #4
	bgt _080208A0
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	ldr r1, [r7]
	adds r0, r1, r0
	b _080208AC
_080208A0:
	subs r0, r4, #4
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r7]
	adds r0, r0, r1
_080208AC:
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _080208B6
	movs r0, #1
	b _080208C2
_080208B6:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bls _0802086E
	movs r0, #0
_080208C2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

