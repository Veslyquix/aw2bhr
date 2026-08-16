	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E940
sub_0802E940: @ 0x0802E940
	push {lr}
	ldr r0, _0802E95C @ =0x04000130
	ldrh r1, [r0]
	movs r0, #9
	bics r0, r1
	cmp r0, #0
	beq _0802E952
	bl sub_08036CB4
_0802E952:
	bl VBlankIntrWait
	pop {r0}
	bx r0
	.align 2, 0
_0802E95C: .4byte 0x04000130

