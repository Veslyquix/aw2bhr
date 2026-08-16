	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080781F0
sub_080781F0: @ 0x080781F0
	push {r4, lr}
	movs r2, #0
	ldr r3, _08078208 @ =gUnknown_0202FE0E
	movs r4, #2
_080781F8:
	adds r0, r2, r3
	ldrb r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0807820C
	movs r0, #1
	b _08078214
	.align 2, 0
_08078208: .4byte gUnknown_0202FE0E
_0807820C:
	adds r2, #1
	cmp r2, #0x29
	ble _080781F8
	movs r0, #0
_08078214:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

