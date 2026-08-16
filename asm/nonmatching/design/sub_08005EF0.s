	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005EF0
sub_08005EF0: @ 0x08005EF0
	push {lr}
	cmp r0, #0
	beq _08005F00
	ldr r0, _08005EFC @ =gUnknown_084886CC
	b _08005F02
	.align 2, 0
_08005EFC: .4byte gUnknown_084886CC
_08005F00:
	ldr r0, _08005F14 @ =gUnknown_084886BC
_08005F02:
	movs r1, #0
	bl sub_080152C0
	ldr r1, _08005F18 @ =gUnknown_0200B0B0
	ldr r1, [r1]
	adds r1, #0x6b
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08005F14: .4byte gUnknown_084886BC
_08005F18: .4byte gUnknown_0200B0B0

