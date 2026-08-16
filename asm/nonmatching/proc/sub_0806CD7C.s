	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CD7C
sub_0806CD7C: @ 0x0806CD7C
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	str r0, [r1, #0x30]
	ldr r0, [r1, #0x34]
	cmp r0, #0
	beq _0806CD94
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
	b _0806CD9A
_0806CD94:
	ldr r0, _0806CDA0 @ =0x000001CF
	bl sub_0803B4DC
_0806CD9A:
	pop {r0}
	bx r0
	.align 2, 0
_0806CDA0: .4byte 0x000001CF

