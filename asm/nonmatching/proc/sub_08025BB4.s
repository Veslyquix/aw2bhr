	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025BB4
sub_08025BB4: @ 0x08025BB4
	push {lr}
	bl sub_08035740
	ldr r0, _08025BD4 @ =gUnknown_03003FC0
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08025BCE
	ldr r0, _08025BD8 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldr r1, _08025BDC @ =gUnknown_03004074
	ldrb r1, [r1]
	bl sub_08025B80
_08025BCE:
	pop {r0}
	bx r0
	.align 2, 0
_08025BD4: .4byte gUnknown_03003FC0
_08025BD8: .4byte gUnknown_030040D8
_08025BDC: .4byte gUnknown_03004074

