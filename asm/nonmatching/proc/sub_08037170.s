	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037170
sub_08037170: @ 0x08037170
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	ldr r2, _080371E4 @ =0xFFF80000
	adds r0, r0, r2
	lsrs r6, r0, #0x10
	ldr r0, _080371E8 @ =0x000003E7
	cmp r5, r0
	bls _08037196
	adds r5, r0, #0
_08037196:
	ldr r4, _080371EC @ =gUnknown_08090EEC
	mov sb, r4
	movs r0, #0xff
	ands r0, r1
	lsls r7, r0, #0x10
_080371A0:
	ldr r1, _080371F0 @ =0x000001FF
	adds r0, r1, #0
	adds r4, r6, #0
	ands r4, r0
	adds r0, r5, #0
	movs r1, #0xa
	bl DivRem
	adds r3, r0, #0
	lsls r3, r3, #1
	add r3, r8
	movs r2, #0x80
	lsls r2, r2, #5
	adds r3, r3, r2
	adds r0, r4, #0
	lsrs r1, r7, #0x10
	mov r4, sb
	ldr r2, [r4]
	bl sub_0801BD00
	adds r0, r5, #0
	movs r1, #0xa
	bl Div
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080371F4
	adds r0, r6, #0
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	b _080371A0
	.align 2, 0
_080371E4: .4byte 0xFFF80000
_080371E8: .4byte 0x000003E7
_080371EC: .4byte gUnknown_08090EEC
_080371F0: .4byte 0x000001FF
_080371F4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

