	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080196C0
sub_080196C0: @ 0x080196C0
	push {lr}
	bl sub_0803866C
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	ldr r2, _080196EC @ =gUnknown_085C77A0
	lsls r1, r1, #2
	ldr r0, _080196F0 @ =gUnknown_03003FC0
	ldrb r3, [r0, #2]
	movs r0, #0x5c
	muls r0, r3, r0
	adds r1, r1, r0
	adds r2, #0x34
	adds r1, r1, r2
	ldr r0, [r1]
	cmp r0, #0
	beq _080196E8
	bl sub_080196F4
_080196E8:
	pop {r0}
	bx r0
	.align 2, 0
_080196EC: .4byte gUnknown_085C77A0
_080196F0: .4byte gUnknown_03003FC0

