	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B640
sub_0803B640: @ 0x0803B640
	push {lr}
	ldr r2, _0803B658 @ =gUnknown_030005C8
	ldrh r1, [r2]
	ldr r0, _0803B65C @ =0x0000FFFF
	cmp r1, r0
	beq _0803B654
	movs r1, #0
	ldrsh r0, [r2, r1]
	bl sub_0803B524
_0803B654:
	pop {r0}
	bx r0
	.align 2, 0
_0803B658: .4byte gUnknown_030005C8
_0803B65C: .4byte 0x0000FFFF

