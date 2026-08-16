	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041D40
sub_08041D40: @ 0x08041D40
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	ldrb r1, [r2, #2]
	ldrb r0, [r6, #2]
	cmp r1, r0
	bhi _08041DAA
	cmp r1, r0
	bne _08041DB8
	ldr r0, _08041DB0 @ =gUnknown_08499594
	ldr r3, [r0]
	subs r0, r2, r3
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r0, r1, #4
	adds r1, r1, r0
	lsls r0, r1, #8
	adds r1, r1, r0
	lsls r0, r1, #0x10
	adds r1, r1, r0
	rsbs r1, r1, #0
	asrs r1, r1, #8
	ldr r0, _08041DB4 @ =gUnknown_08499598
	ldr r4, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x69
	ldrb r5, [r0]
	movs r2, #0x7f
	subs r3, r6, r3
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x69
	ldrb r1, [r1]
	adds r0, r2, #0
	ands r0, r5
	ands r2, r1
	cmp r0, r2
	bls _08041DB8
_08041DAA:
	movs r0, #1
	b _08041DBA
	.align 2, 0
_08041DB0: .4byte gUnknown_08499594
_08041DB4: .4byte gUnknown_08499598
_08041DB8:
	movs r0, #0
_08041DBA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

