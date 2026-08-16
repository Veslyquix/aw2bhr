	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B5E8
sub_0801B5E8: @ 0x0801B5E8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _0801B5FC @ =gUnknown_0200CD0C
	ldrb r0, [r0]
	cmp r0, #1
	beq _0801B600
	movs r0, #1
	b _0801B60E
	.align 2, 0
_0801B5FC: .4byte gUnknown_0200CD0C
_0801B600:
	ldr r0, _0801B614 @ =gUnknown_03005C84
	ldr r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0801B60E:
	pop {r1}
	bx r1
	.align 2, 0
_0801B614: .4byte gUnknown_03005C84

