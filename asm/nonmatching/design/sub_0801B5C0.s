	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B5C0
sub_0801B5C0: @ 0x0801B5C0
	push {lr}
	ldr r0, _0801B5D0 @ =gUnknown_0200CD0C
	ldrb r0, [r0]
	cmp r0, #1
	beq _0801B5D4
	movs r0, #1
	b _0801B5E0
	.align 2, 0
_0801B5D0: .4byte gUnknown_0200CD0C
_0801B5D4:
	ldr r0, _0801B5E4 @ =gUnknown_03005C80
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0801B5E0:
	pop {r1}
	bx r1
	.align 2, 0
_0801B5E4: .4byte gUnknown_03005C80

