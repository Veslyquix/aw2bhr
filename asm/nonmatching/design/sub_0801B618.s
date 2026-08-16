	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B618
sub_0801B618: @ 0x0801B618
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _0801B62C @ =gUnknown_0200CD0C
	ldrb r0, [r0]
	cmp r0, #1
	beq _0801B630
	movs r0, #1
	b _0801B63E
	.align 2, 0
_0801B62C: .4byte gUnknown_0200CD0C
_0801B630:
	ldr r0, _0801B644 @ =gUnknown_03005C74
	ldr r2, [r0]
	adds r0, r3, #0
	bl _call_via_r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0801B63E:
	pop {r1}
	bx r1
	.align 2, 0
_0801B644: .4byte gUnknown_03005C74

