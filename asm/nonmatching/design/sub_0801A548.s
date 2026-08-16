	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A548
sub_0801A548: @ 0x0801A548
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _0801A55C
	movs r0, #0
	movs r1, #8
	bl sub_0802D5CC
	b _0801A572
_0801A55C:
	ldr r0, _0801A578 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x1a]
	subs r0, #1
	movs r1, #8
	bl sub_0802D5CC
_0801A572:
	pop {r0}
	bx r0
	.align 2, 0
_0801A578: .4byte gUnknown_08499598

