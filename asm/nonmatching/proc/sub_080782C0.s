	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080782C0
sub_080782C0: @ 0x080782C0
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	mov ip, r1
	ldr r2, [r3]
	movs r4, #0
	movs r0, #0
	ldrsb r0, [r2, r0]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080782F8
	ldr r7, _08078308 @ =gUnknown_0202FE0E
	adds r5, r1, #0
	movs r6, #2
_080782DC:
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r7
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080782EE
	adds r4, #1
_080782EE:
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, r5
	bne _080782DC
_080782F8:
	ldrb r0, [r3, #4]
	cmp r4, r0
	beq _08078312
	ldrb r3, [r3, #5]
	cmp r4, r3
	beq _0807830C
	movs r0, #0
	b _08078314
	.align 2, 0
_08078308: .4byte gUnknown_0202FE0E
_0807830C:
	movs r0, #3
	mov r1, ip
	str r0, [r1, #0x58]
_08078312:
	movs r0, #1
_08078314:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

